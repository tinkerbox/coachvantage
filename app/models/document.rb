class Document < ActiveRecord::Base
  attr_accessible :name, :file

	has_attached_file :file

	belongs_to :user
	belongs_to :contact
end