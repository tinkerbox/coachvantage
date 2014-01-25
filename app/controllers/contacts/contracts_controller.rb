class Contacts::ContractsController < ApplicationController
	layout 'content_layout'

  def new
  end

  def index
  	@contact = current_user.contacts.find(params[:contact_id])
  	@contract = @contact.contracts.where(:status => "live").first
  	if @contract.nil?
  		@contract = Contract.new
  	end
  end

  def create
  	@contact = current_user.contacts.find(params[:contact_id])

  	contract = @contact.contracts.create(params[:contract])
  	contract.user_id = current_user.id
  	redirect_to contact_contracts_path(params[:contact_id]), :notice => "Contract is successfully created."
  	# if contract.save
	  # 	redirect_to contact_contracts_path(params[:contact_id]), :notice => "Contract is successfully created."
	  # else
	  # 	redirect_to contact_contracts_path(params[:contact_id]), :alert => "Failed to create contract"
	  # end
  end
end