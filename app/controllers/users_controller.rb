class UsersController < ApplicationController
  def create
    @user = User.new(params[:user])
    
    if @user.save
      login_user!(username: params[:user][:username],
                  password: params[:user][:password])
      render text: 'yay! you created an account and are signed in!'
    else
      flash.now[:error] = @user.errors.full_messages
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])  
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
    render json: @user
  end
  
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    
    if @user.save
      render text: 'updated!'
    else
      flash.now[:error] = @user.errors.full_messages
      render :edit
    end
  end
  
end
