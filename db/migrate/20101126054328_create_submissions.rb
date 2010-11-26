class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :title
      t.string :submission_type
      t.text :abstract
      t.text :comments
      t.integer :duration
      t.integer :user_id
      t.string :submission_status, :default => "SUBMITTED"
      t.string :audience_type

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
