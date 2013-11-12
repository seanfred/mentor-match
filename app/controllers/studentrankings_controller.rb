class StudentrankingsController < ApplicationController
  before_filter :find_mentor, :except => [ :index,
                                            :update_ranks]
  before_filter :authorize_mentor!

  def index
    @rankings = @@student_user.studentrankings
  end

  def new
    # find the last ranked student
    last_ranking = @@student_user.studentrankings.order("rank").last
    # see if a ranking already exists for this student
    exists_rankings = @@student_user.studentrankings.where(mentor_id: @mentor.id)
    # this is the new rank of the student being added to the rankings
    new_rank =  if last_ranking
                  last_ranking.rank + 1
                else
                  1
                end
    rank = current_user.student.studentrankings.build(mentor_id: @mentor.id, rank: new_rank)
    count = Studentranking.all.count

    if count > 5
      message = "Sorry, your rankings are full." +
                " Please, delete a ranking first."
    elsif exists_rankings.present?
      message = "You've already added this student to your rankings."
    elsif rank.save
            message = "Mentor #" + @mentor.id.to_s + " has been added to your rankings."
    else
      message = "Sorry, there was a problem,
                and your rankings weren't updated."
    end

    respond_to do |format|
      format.html  {flash[:notice] = message
                    redirect_to '/studentrankings'}
      format.js
    end
  end

  def update_ranks
    ranks = JSON.parse(params[:ranking])
    ranks.each do |key, value|
      update_item = Studentranking.find(key)
      update_item.rank = value
      update_item.save
    end
    render text: "success", status: 200
  end

  def destroy
    @rank = Studentranking.find(params[:id])
    @rank.destroy
    respond_to do |format|
      format.html { redirect_to '/studentrankings' }
      format.js
    end
  end

  private

  def find_mentor
    @mentor = Mentor.find(params[:mentor_id])
  end

  def authorize_mentor!
    if current_user.student
      @@student_user = current_user.student
    else
      flash[:notice] = "You cannot access this page!"
      redirect_to root_path
    end
  end
end
