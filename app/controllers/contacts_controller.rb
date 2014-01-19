class ContactsController < ApplicationController
  before_filter :authenticate_user!
	layout 'content_layout'

  def index
    @contacts = current_user.contacts
  end

  def index_by_type
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def show
    @contact = Contact.find(params[:id])
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
    
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def update
    contact = Contact.find(params[:id])
    contact.update_attributes(params[:contact])

    redirect_to contact_details_path(params[:id]), notice: "Contact is updated successfully."
  end
end