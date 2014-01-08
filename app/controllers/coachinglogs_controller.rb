class CoachinglogsController < ApplicationController
  before_filter :authenticate_user!
	layout 'content_layout'
	
  def index
  end

  def new
  end

  def edit
  end
end