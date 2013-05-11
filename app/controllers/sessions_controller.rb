class SessionsController < ApplicationController
  def create
    session[:logged_in] = true
    redirect_to :back, notice: 'Logged in!'
  end

  def destroy
    session[:logged_in] = false
    redirect_to :back, notice: 'Logged out!'
  end
end