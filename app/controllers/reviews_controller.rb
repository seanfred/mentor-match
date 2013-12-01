class ReviewsController < ApplicationController
  before_filter :set_mentor
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @mentor.reviews

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = @mentor.reviews.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = @mentor.reviews.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = @mentor.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @mentor.reviews.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to [@mentor, @review], notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = @mentor.reviews.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to [@mentor, @review], notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = @mentor.reviews.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to mentor_reviews_path(@mentor) }
      format.json { head :no_content }
    end
  end

  private

  def set_mentor
    @mentor = Mentor.find(params[:mentor_id])
  end

end
