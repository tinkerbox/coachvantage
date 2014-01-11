class Contacts::NotesController < ApplicationController
	layout 'content_layout'

	def new
  	@contact = Contact.find(params[:contact_id])
		@note = @contact.notes.create(:caption => 'Untitled')
		redirect_to contact_notes_path
	end

  def index
  	@contact = Contact.find(params[:contact_id])
  	@notes = @contact.notes.all
  end

  def edit
  	@contact = Contact.find(params[:contact_id])
  	@note = @contact.notes.find(params[:id])

  	redirect_to contact_notes_path
  	# respond_to do |format|
   #    format.json { render :json => @note }
   #  end
  end

  def show
  end
end