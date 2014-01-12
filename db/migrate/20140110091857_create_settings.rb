class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
    	t.belongs_to :user
    	t.string :color_scheme
    	t.string :motivational_quotes_feed
    	t.string :custom_logo
    	t.string :customized_message
    	t.string :payment_service
    	t.string :paypal_email_address
    	t.string :sync_calendars
    	t.string :buffer_time
    	t.string :freshbook_id
    	t.string :intuit_id

      t.timestamps
    end
  end
end