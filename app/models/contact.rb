class Contact < ActiveRecord::Base
  attr_accessible :birthday, :biz_obj, :biz_title, :company_addr, :company_name, :email
  attr_accessible :first_name, :last_name, :gender, :home_addr, :interests, :tel_office
  attr_accessible :life_obj, :mobile, :profile, :salutation, :skype_id, :tel_home

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :gender, presence: true
	validates :email, presence: true
	validates :skype_id, presence: true

	belongs_to :user
end