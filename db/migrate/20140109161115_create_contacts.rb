class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :user
      t.string :salutation
      t.string :first_name, :null => false, :default => ''
      t.string :last_name, :null => false, :default => ''
      t.string :gender, :null => false, :default => ''
      t.date :birthday
      t.string :home_addr
      t.string :mobile
      t.string :tel_home
      t.string :tel_office
      t.string :email, :null => false, :default => ''
      t.string :skype_id, :null => false, :default => ''
      t.string :biz_title
      t.string :company_name
      t.string :company_addr
      t.string :interests
      t.string :life_obj
      t.string :biz_obj
      t.string :profile

      t.timestamps
    end

    add_index :contacts, :email, :unique => true
  end
end
