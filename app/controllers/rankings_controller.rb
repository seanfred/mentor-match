class RankingsController < ApplicationController
  before_filter :find_student, :except => [ :index,
                                            :update_ranks]
  before_filter :authorize_mentor!

  def index
    @rankings = @@mentor_user.rankings
  end

  def new
    # find the last ranked student
    last_ranking = @@mentor_user.rankings.order("rank").last
    # see if a ranking already exists for this student
    exists_rankings = @@mentor_user.rankings.where(student_id: @student.id)
    # this is the new rank of the student being added to the rankings
    new_rank =  if last_ranking
                  last_ranking.rank + 1
                else
                  1
                end
    rank = current_user.mentor.rankings.build(student_id: @student.id, rank: new_rank)
    count = Ranking.all.count

    if count > 5
      message = "Sorry, your rankings are full." +
                " Please, delete a ranking first."
    elsif exists_rankings.present?
      message = "You've already added this student to your rankings."
    elsif rank.save
            message = "Student #" + @student.id.to_s + " has been added to your rankings."
    else
      message = "Sorry, there was a problem,
                and your rankings weren't updated."
    end

    respond_to do |format|
      format.html  {flash[:notice] = message
                    redirect_to '/rankings'}
      format.js
    end
  end

  def update_ranks
    ranks = JSON.parse(params[:ranking])
    ranks.each do |key, value|
      update_item = Ranking.find(key)
      update_item.rank = value
      update_item.save
    end
    render text: "success", status: 200
  end

  def destroy
    @rank = Ranking.find(params[:id])
    @rank.destroy
    respond_to do |format|
      format.html { redirect_to '/rankings' }
      format.js
    end
  end

  private

  def find_student
    @student = Student.find(params[:student_id])
  end

  def authorize_mentor!
    if current_user.mentor
      @@mentor_user = current_user.mentor
    else
      flash[:notice] = "You cannot access this page!"
      redirect_to root_path
    end
  end
end
