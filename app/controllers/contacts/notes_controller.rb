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
    params[:id] = -1
  end

  def show
    redirect_to contact_notes_path
  end

  def edit
  	@contact = Contact.find(params[:contact_id])
  	@note = @contact.notes.find(params[:id])

  	respond_to do |format|
      format.json { render :json => @note }
    end
  end

  def update
    @contact = Contact.find(params[:contact_id])
    @note = @contact.notes.find(params[:id])

    @note.update_attributes(params[:note])
    redirect_to contact_notes_path
  end

  def destroy
    @contact = Contact.find(params[:contact_id])
    @note = @contact.notes.find(params[:id])

    @note.destory
    redirect_to contact_notes_path
  end
end