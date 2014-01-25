class CreateSessionLogs < ActiveRecord::Migration
  def change
    create_table :session_logs do |t|
    	t.belongs_to :user
    	t.belongs_to :contact

    	t.date				:date
    	t.decimal	 		:duration
    	t.string			:billing_status
      
      t.timestamps
    end
  end
end
