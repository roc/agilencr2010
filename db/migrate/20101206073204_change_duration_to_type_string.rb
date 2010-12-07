class ChangeDurationToTypeString < ActiveRecord::Migration
  def self.up
    change_column :submissions, :duration, :string
  end

  def self.down
  end
end