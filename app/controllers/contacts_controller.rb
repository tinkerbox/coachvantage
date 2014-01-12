class ContactsController < ApplicationController
  before_filter :authenticate_user!
	layout 'content_layout'

  def index
    @contacts = current_user.contacts
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
      redirect_to contacts_path, alert: 'FAiled'
    end
  end
end