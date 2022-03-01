class AddIsAdminToUser < ActiveRecord::Migration[5.2]
  
  def self.up
    change_table :users do |t|
      t.boolean :is_admin, default: false
    end
  end

  def self.down
    remove_column :is_admin
  end

end
