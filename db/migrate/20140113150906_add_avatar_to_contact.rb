class AddAvatarToContact < ActiveRecord::Migration
  def up
		add_attachment :contacts, :avatar
  end
  
  def down
  	remove_attachment :contacts, :avatar
  end
end
