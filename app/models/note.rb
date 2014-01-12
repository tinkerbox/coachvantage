class Note < ActiveRecord::Base
  attr_accessible :caption, :content

  belongs_to :contact
end
