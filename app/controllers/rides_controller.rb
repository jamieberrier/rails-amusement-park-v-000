class RidesController < ApplicationController
  def create
    @ride = Ride.new(user_id: params[:user_id], attraction_id: params[:attraction_id])
    @result = @ride.take_ride
    if @result.include?("Sorry")
      flash[:notice] = @result
    else
      flash[:success] = @result
    end
    redirect_to user_path(current_user.id)
  end
end
