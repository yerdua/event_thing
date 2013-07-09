class SessionsController < ApplicationController
  def create
    @user = login_user!(params[:user])
    
    if @user
      render text: 'fuck yeah. signed in'
    else
      @user = User.new(params[:user])
      render text: 'you fail at signing in. try again'
    end
  end

  def destroy
    if logged_in?
      current_user.session_token = nil
      session[:session_token] = nil
    end
  end
  
  def new
    @user = User.new
  end
  
end
