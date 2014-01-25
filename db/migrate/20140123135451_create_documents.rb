class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
    	t.belongs_to :user
    	t.belongs_to :contact

    	t.string :name
      t.timestamps
    end
  end
end
