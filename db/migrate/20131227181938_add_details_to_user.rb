class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :salutation, :string
    add_column :users, :first_name, :string, :null => false
    add_column :users, :last_name, :string, :null => false
    add_column :users, :gender, :integer, :null => false
    add_column :users, :birthday, :date, :null => false
    add_column :users, :home_addr, :string
    add_column :users, :mobile, :string
    add_column :users, :tel_home, :string
    add_column :users, :tel_office, :string
    add_column :users, :skype_id, :string, :null => false
    add_column :users, :biz_title, :string
    add_column :users, :company_name, :string
    add_column :users, :company_addr, :string
    add_column :users, :interests, :string
    add_column :users, :life_obj, :string
    add_column :users, :biz_obj, :string
    add_column :users, :profile, :string
  end
end