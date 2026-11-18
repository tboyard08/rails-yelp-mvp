class ReviewsController < ApplicationController

  # GET /reviews/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # POST /reviews
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    @review.save

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

    # Only allow a list of trusted parameters through.
    def review_params
      params.expect(review: [ :rating, :content, :restaurant_id ])
    end
end
