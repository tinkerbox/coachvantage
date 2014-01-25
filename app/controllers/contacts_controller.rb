class ContactsController < ApplicationController
  before_filter :authenticate_user!
	layout 'content_layout'

  def index
    @contacts = current_user.contacts
    @current_type = "All Contacts"
  end

  def index_by_type
    @current_type = params[:display_contact][:type]
    if @current_type == "All Contacts"
      @contacts = current_user.contacts
    else
      @contacts = current_user.contacts.where(:contact_type => @current_type[0..(@current_type.length - 2)])
    end
    render "index"
  end

  def add_doc
    document = current_user.contacts.find(params[:id]).documents.create(params[:document])
    document.user_id = current_user.id
    document.name = document.file.original_filename
    if document.save
      redirect_to contact_notes_path(params[:id]), notice: 'Succeed'
    else
      redirect_to contact_notes_path(params[:id]), alert: 'Failed'
    end
  end

  def add_sessionlog
    sessionlog = current_user.contacts.find(params[:id]).session_logs.create(params[:sessionlog])
    sessionlog.user_id = current_user.id
    if sessionlog.save
      redirect_to :back, notice: "Succeed"
    else
      redirect_to :back, alert: "Failed"
    end
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def show
    @contact = current_user.contacts.find(params[:id])
  end

  def create
    email_exist = current_user.contacts.where(:email => params[:contact][:email]).exists?

    if email_exist
      redirect_to contacts_path, alert: 'Contact account is already exist. Confirm or reset the password.'
      return
    end

    @contact = current_user.contacts.create(params[:contact])

    if @contact.save
      redirect_to contacts_path, notice: 'Succeed'
    else
      redirect_to contacts_path, alert: 'Failed'
    end
  end

  def update_contact_info
    contact = Contact.find(params[:id])
    contact.update_attributes(params[:contact])
    
    redirect_to :back
  end

  def update
    contact = Contact.find(params[:id])
    contact.update_attributes(params[:contact])

    redirect_to contact_details_path(params[:id]), notice: "Contact is updated successfully."
  end
end