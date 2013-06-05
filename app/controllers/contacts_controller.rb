class ContactsController < ApplicationController
	before_filter :signed_in_user
	before_filter :correct_user, only: [:destroy, :edit, :update]
	# before_filter :check_phone_number_duplication, only: [:update, :create]

	def index
		@contact = current_user.contacts.new
  		@contacts = current_user.contacts.paginate(page: params[:page], :per_page => 5)
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def new
		
	end

	def create
		existing_contact = current_user.contacts.
							find_by_phone_number(params[:contact][:phone_number])
		@contact = current_user.contacts.build(params[:contact])	
		if existing_contact.nil?
			# @contact = current_user.contacts.build(params[:contact])	
			if @contact.save
				flash[:success] = "Contact created!"
				redirect_to contacts_path
			else
				# @contact = current_user.contacts.new
				@contacts = current_user.contacts.paginate(page: params[:page], :per_page => 5)
				render 'index'
			end
		else
			# @contact.errors(:Contact, "")
			# @contact = current_user.contacts.new
			flash.now[:error] = "Contact already exists!"	
			@contacts = current_user.contacts.paginate(page: params[:page], :per_page => 5)
			render 'index'
		end


		
			# @contact = current_user.contacts.build(params[:contact])	
			# if @contact.save
			# 	flash[:success] = "Contact created!"
			# 	redirect_to contacts_path
			# else
			# 	#@contact = current_user.contacts.new # this make the 1st @contact missed
			# 	@contacts = current_user.contacts.paginate(page: params[:page], :per_page => 5)
			# 	render 'index'
			# end
		
	end

	def destroy
		@contact.destroy
		redirect_to root_path
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
		if @contact.update_attributes(params[:contact])
			flash[:success] = "Contact updated!"
			redirect_to contacts_path
		else
			render 'edit'
		end
	end

	private

		def correct_user
			@contact = current_user.contacts.find_by_id(params[:id])
			redirect_to root_path if @contact.nil?
		end
end
