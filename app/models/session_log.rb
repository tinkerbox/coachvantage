class SessionLog < ActiveRecord::Base
  attr_accessible :duration, :date, :billing_status

  validates_presence_of :duration

  belongs_to :user
  belongs_to :contact
end