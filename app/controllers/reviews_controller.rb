class ReviewsController < ApplicationController
  before_action :logged_in_user

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @course = Course.find_by(id: params[:course_id])

    if @review.save
      flash[:success] = "Review created!"
      redirect_to @review.course
    else
      flash[:danger] = "Review create failed!"
      redirect_to @review.course
    end
  end

  def edit
    @review = Review.find_by(id: params[:id])
    @course = @review.course
  end

  def update
    @review = Review.find_by(id: params[:id])

    if @review.update(review_params)
      flash[:success] = "Review updated!"
      redirect_to @review.course
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:success] = "Review deleted!"
    redirect_back(fallback_location: @user)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :course_id, :content)
  end
end
