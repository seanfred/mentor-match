class MentorshipsController < ApplicationController
  # GET /mentorships
  # GET /mentorships.json
  def index
    @mentorships = Mentorship.all


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mentorships }
    end
  end

  # GET /mentorships/1
  # GET /mentorships/1.json
  def show
    @mentorship = Mentorship.find(params[:id])
    @students = Student.all
    @mentors = Mentor.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mentorship }
    end
  end

  # GET /mentorships/new
  # GET /mentorships/new.json
  def new
    @mentorship = Mentorship.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mentorship }
    end
  end

  # GET /mentorships/1/edit
  def edit
    @mentorship = Mentorship.find(params[:id])
  end

  # POST /mentorships
  # POST /mentorships.json
  def create
    @mentorship = Mentorship.new(params[:mentorship])

    respond_to do |format|
      if @mentorship.save
        format.html { redirect_to mentorships_url, notice: 'Mentorship was successfully created.' }
        format.json { render json: @mentorship, status: :created, location: @mentorship }
      else
        format.html { render action: "new" }
        format.json { render json: @mentorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mentorships/1
  # PUT /mentorships/1.json
  def update
    @mentorship = Mentorship.find(params[:id])

    respond_to do |format|
      if @mentorship.update_attributes(params[:mentorship])
        format.html { redirect_to @mentorship, notice: 'Mentorship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mentorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mentorships/1
  # DELETE /mentorships/1.json
  def destroy
    @mentorship = Mentorship.find(params[:id])
    @mentorship.destroy

    respond_to do |format|
      format.html { redirect_to mentorships_url }
      format.json { head :no_content }
    end
  end
end
