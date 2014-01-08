class ContactsController < ApplicationController
  before_filter :authenticate_user!
	layout 'content_layout'

  def index
    @users = User.with_role :coachee
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    @user.name = @user.first_name + ' ' + @user.last_name
    email_exist = User.where(:email => params[:user][:email]).exists?
    name_exist = User.where(:name => @user.name).exists?

    if email_exist
      redirect_to contacts_path, alert: 'Contact account is already exist. Confirm or reset the password.'
      return
    end

    if name_exist
      redirect_to contacts_path, alert: 'Contact name is already taken. Change your name.'
      return
    end
    @user.password = 'tesdfsdfsdfst';
    @user.add_role :coachee
    puts '=================================='
    puts @user.inspect
    if @user.save
      puts 'Succeed'
      redirect_to contacts_path, notice: 'Succeed'
    else
      puts 'Failed'
      redirect_to contacts_path, alert: 'FAiled'
    end
    puts '=================================='
  end
end