class ChangePhoneToStringInUsers < ActiveRecord::Migration
  def self.up
		change_column :users, :user_phone, :string
  end

  def self.down
  end
end
