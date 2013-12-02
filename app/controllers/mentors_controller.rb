class MentorsController < ApplicationController

  before_filter :authenticate_user!

    @@config = {
      :site => 'https://api.linkedin.com',
      :authorize_path => '/uas/oauth/authenticate',
      :request_token_path => '/uas/oauth/requestToken?scope=r_basicprofile+r_fullprofile+r_network+rw_nus',
      :access_token_path => '/uas/oauth/accessToken'
  }

  def index
    @mentors = Mentor.where(:active => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mentors }
    end
  end


  def show
    @mentor = Mentor.find(params[:id])
    @profile = Linkedin::Profile.get_profile("#{@mentor.profile}")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @mentor }
    end
  end


  def new
    @mentor = Mentor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @mentor }
    end
  end


  def edit
    @mentor = Mentor.find(params[:id])
  end


  def create
    @mentor = Mentor.new(params[:mentor])

    respond_to do |format|
      if @mentor.save
        format.html { redirect_to @mentor, notice: 'Mentor was successfully created.' }
        format.json { render json: @mentor, status: :created, location: @mentor }
      else
        format.html { render action: "new" }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @mentor = Mentor.find(params[:id])

    respond_to do |format|
      if @mentor.update_attributes(params[:mentor])
        format.html { redirect_to @mentor, notice: 'Mentor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @mentor = Mentor.find(params[:id])
    @mentor.destroy

    respond_to do |format|
      format.html { redirect_to mentors_url }
      format.json { head :no_content }
    end
  end




end
