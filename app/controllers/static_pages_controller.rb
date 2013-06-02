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
end
