class Contacts::NotesController < ApplicationController
	layout 'content_layout'
  def index
  	@contact = Contact.find(params[:contact_id])
  end

  def show
  	
  end
end