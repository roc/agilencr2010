class AddOrgAndPhoneToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :user_organization, :string
    add_column :users, :user_phone, :integer
  end

  def self.down
    remove_column :users, :user_phone
    remove_column :users, :user_organization
  end
end
