class Contact < ActiveRecord::Base
  attr_accessible :birthday, :biz_obj, :biz_title, :company_addr, :company_name, :email
  attr_accessible :first_name, :last_name, :gender, :home_addr, :interests, :tel_office
  attr_accessible :life_obj, :mobile, :profile, :salutation, :skype_id, :tel_home
  attr_accessible :contact_type
	attr_accessible :avatar
	
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => '/assets/avatar/blank_user.jpg'

	belongs_to :user

	has_many :notes
	has_many :documents
	has_many :contracts
	has_many :session_logs

	def name
		self.first_name + " " + self.last_name
	end
end