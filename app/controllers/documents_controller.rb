class DocumentsController < ApplicationController
  before_filter :authenticate_user!
	layout 'content_layout'
  def index
  end
end
