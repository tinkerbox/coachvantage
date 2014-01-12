class Contacts::DetailsController < ApplicationController
	layout 'content_layout'
  def index
  	@contact = Contact.find(params[:contact_id])
  end
end
