class MessagesController < ApplicationController
	before_filter :signed_in_user
	 before_filter :correct_user, only: [:edit, :update, :destroy]

	def index
  		@messages = current_user.messages.paginate(page: params[:page], :per_page => 5)
  		@contacts = Contact
	end

	def new
		@contact = Contact.find(params[:id])
		@message = Message.new(from_phone_number: current_user.phone_number,
								to_phone_number: @contact.phone_number)
	end

	def create
		@message = current_user.messages.build(params[:message])
		if @message.save
			flash[:success] = "Sent successfully!"
			redirect_to messages_path
		else
			render 'new'
		end
	end

	def destroy
		@message.destroy
		redirect_to messages_path
	end

	private

		def correct_user
			@message = current_user.messages.find_by_id(params[:id])
			redirect_to root_path if @message.nil?
		end
end
