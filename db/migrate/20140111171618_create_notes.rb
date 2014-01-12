class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
    	t.belongs_to :contact
      t.string :caption
      t.string :content

      t.timestamps
    end
  end
end
