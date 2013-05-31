class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    params[:user][:email] = params[:user][:phone_number] + "@gmail.com"
    params[:user][:first_name] = params[:user][:phone_number]
  	@user = User.new(params[:user])
  	if @user.save
      flash[:success] = "Welcome to the Cloud Phone Book!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end
end
