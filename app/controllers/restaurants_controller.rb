class RestaurantsController < ApplicationController
  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @restaurant.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant.destroy!

    respond_to do |format|
      format.html { redirect_to restaurants_path, notice: "Restaurant was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.expect(restaurant: [ :name, :address, :phone_number, :category ])
    end
end
