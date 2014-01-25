class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
    	t.belongs_to :user
    	t.belongs_to :contact

    	t.string 			:contract_type
    	t.integer 		    :period
    	t.date				:start_date
    	t.date 				:end_date
    	t.decimal	 		:session_duration
    	t.string			:billing_arrangement
    	t.decimal			:fees

    	t.string			:status

      t.timestamps
    end
  end
end
