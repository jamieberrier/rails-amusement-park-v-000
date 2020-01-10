class RidesController < ApplicationController
  before_action :require_logged_in

  def create
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    binding.pry
    @result = @ride.take_ride
    flash[@result.keys[0].to_s] = @result.values[0]
    redirect_to user_path(current_user.id)
  end
end
