class Contract < ActiveRecord::Base
	attr_accessible :contract_type, :period, :start_date, :end_date
	attr_accessible :session_duration, :billing_arrangement, :fees, :status
	
	validates_presence_of :period, :start_date, :end_date
	validates_presence_of :session_duration, :fees

	belongs_to :user
	belongs_to :contact
end