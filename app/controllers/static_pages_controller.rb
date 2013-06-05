class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      redirect_to contacts_path
  	end
  end

  def help
  end

  def about
  end

  def contact_me
  end

  def search
    key_word = '%' + params[:search] + '%'
    @contacts = current_user.contacts.where("first_name like ? OR
                last_name like ? OR phone_number like ? OR
                email like ? OR address like ? OR company like ?", 
                key_word, key_word, key_word,
                key_word, key_word, key_word).
                paginate(page: params[:page], :per_page => 10)
  end
end
