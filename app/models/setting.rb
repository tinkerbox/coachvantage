class Setting < ActiveRecord::Base
  attr_accessible :color_scheme, :motivational_quotes_feed, :custom_logo, :customized_message,
  						:payment_service, :paypal_email_address, :sync_calendars, :buffer_time, :freshbook_id, :intuit_id

  belongs_to :user
end