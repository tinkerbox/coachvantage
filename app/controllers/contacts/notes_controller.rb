class Contacts::NotesController < ApplicationController
	layout 'content_layout'

	def new
  	@contact = Contact.find(params[:contact_id])
		@note = @contact.notes.create(:caption => 'Untitled')

    respond_to do |format|
      format.json { render :json => @note }
    end
	end

  def index
  	@contact = Contact.find(params[:contact_id])
  	@notes = @contact.notes.all
  end

  def show
    @contact = Contact.find(params[:contact_id])
    @note = Note.new(params[:note])
    if params[:commit] == 'SAVE NOTE'
    elsif params[:commit] == 'DELETE NOTE'
    end

    redirect_to contact_notes_path
  end

  def edit
  	@contact = Contact.find(params[:contact_id])
  	@note = @contact.notes.find(params[:id])

  	respond_to do |format|
      format.json { render :json => @note }
    end
  end

  def show
  end
end