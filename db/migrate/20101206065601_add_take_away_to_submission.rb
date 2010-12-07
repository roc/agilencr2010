class AddTakeAwayToSubmission < ActiveRecord::Migration
  def self.up
    add_column :submissions, :take_away, :text
  end

  def self.down
    remove_column :submissions, :take_away
  end
end
