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
    @contact = current_user.contacts.create(params[:contact])
    # email_exist = Contact.where(:email => @contact.email).exists?

    # if email_exist
    #   redirect_to contacts_path, alert: 'Contact account is already exist. Confirm or reset the password.'
    #   return
    # end
    puts '=================================='
    puts @contact.inspect
    if @contact.save
      puts 'Succeed'
      redirect_to contacts_path, notice: 'Succeed'
    else
      puts 'Failed'
      redirect_to contacts_path, alert: 'FAiled'
    end
    puts '=================================='
  end
end