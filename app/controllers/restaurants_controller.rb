class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    # we need `restaurant_id` to associate restaurant with corresponding restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.restaurant = @restaurant
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end
  
  private

  def review_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
  
end
