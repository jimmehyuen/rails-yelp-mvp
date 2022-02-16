class ReviewsController < ApplicationController
  # def index
  #   @reviews = Review.all
  # end

  # def show
  #   @review = Review.find(params[:id])
  # end

  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
