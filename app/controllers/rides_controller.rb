class RidesController < ApplicationController
  before_action :require_logged_in

  def create
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @message = @ride.take_ride
    binding.pry
    flash[:error] = @message.values[0]
    redirect_to user_path(current_user.id)
  end
end
