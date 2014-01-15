class DashboardsController < ApplicationController
  before_filter :authenticate_user!
  layout 'content_layout'
  
  def index
  	@contacts = current_user.contacts
  end
end
