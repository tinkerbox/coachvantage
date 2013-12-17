class ContactController < ApplicationController
  before_filter :authenticate_user!
	layout 'content_layout'

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def create
  end
end