class Contact < ActiveRecord::Base
  attr_accessible :birthday, :biz_obj, :biz_title, :company_addr, :company_name, :email
  attr_accessible :first_name, :last_name, :gender, :home_addr, :interests, :tel_office
  attr_accessible :life_obj, :mobile, :profile, :salutation, :skype_id, :tel_home
  attr_accessible :contact_type

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :gender, presence: true
	validates :email, presence: true

	belongs_to :user

	has_many :notes

	def name
		self.first_name + " " + self.last_name
	end
end