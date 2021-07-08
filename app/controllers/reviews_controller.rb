class ReviewsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  # def find_review
  #   @review = Review.find(params[:restaurant_id])
  # end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
