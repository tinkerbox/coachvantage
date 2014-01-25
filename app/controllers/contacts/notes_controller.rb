class Contacts::NotesController < ApplicationController
	layout 'content_layout'

	def new
  	@contact = current_user.contacts.find(params[:contact_id])
		@note = @contact.notes.create(:caption => 'Untitled')

    respond_to do |format|
      format.json { render :json => @note }
    end
	end

  def index
  	@contact = current_user.contacts.find(params[:contact_id])
  	@notes = @contact.notes.all
    @documents = @contact.documents.all
  end

  def show
    redirect_to contact_notes_path
  end

  def create
    if params[:note][:caption].nil?
      redirect_to :back and return
    end

    @contact = current_user.contacts.find(params[:contact_id])
    @note = @contact.notes.create params[:note]

    respond_to do |format|
      format.json { render :json => @note }
    end
  end

  def edit
  	@contact = current_user.contacts.find(params[:contact_id])
  	@note = @contact.notes.find(params[:id])

  	respond_to do |format|
      format.json { render :json => @note }
    end
  end

  def update
    @contact = current_user.contacts.find(params[:contact_id])
    @note = @contact.notes.find(params[:id])

    @note.update_attributes(params[:note])
    # redirect_to contact_notes_path

    respond_to do |format|
      format.json { render :json => @note }
    end
  end

  def destroy
    @contact = current_user.contacts.find(params[:contact_id])
    @note = @contact.notes.find(params[:id]).delete
    redirect_to contact_notes_path
  end
end