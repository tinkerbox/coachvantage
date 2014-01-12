class Contacts::ContractsController < ApplicationController
	layout 'content_layout'
  def new
  end

  def index
  	@contact = Contact.find(params[:contact_id])
  end
end
