class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_phone_number(params[:session][:phone_number])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'Invalid phone number/password combination' 
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
	end
end
