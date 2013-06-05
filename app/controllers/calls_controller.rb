class CallsController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user, only: [:destroy, :edit, :update]

	def index
		@calls = current_user.calls.paginate(page: params[:page], :per_page => 5)
		@contacts = Contact
	end

	def new

	end

	def create
		from_phone_number = current_user.phone_number
		to_phone_number = Contact.find(params[:id]).phone_number
		@call = current_user.calls.build(from_phone_number: from_phone_number,
											to_phone_number: to_phone_number)
		if @call.save
			flash[:success] = "Called successfully!"
			redirect_to calls_path
		else
			flash[:error] = @call.errors.full_messages
			redirect_to contacts_path
		end
	end

	def destroy
		@call.destroy
		redirect_to calls_path
	end

	private

		def correct_user
			@call = current_user.calls.find_by_id(params[:id])
			redirect_to root_path if @call.nil?
		end
end
