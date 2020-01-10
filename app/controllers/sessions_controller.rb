class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    # try is an ActiveSupport method. object.try(:some_method) means if object != nil then object.some_method else nil end.
    authenticated = @user.try(:authenticate, params[:user][:password])
    # Users should not be able to log in if they enter an incorrect password. Just redirect them back to the login page.
    flash[:error] = "Invalid Log In Credentials"

    return redirect_to signin_path unless authenticated

    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
