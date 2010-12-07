class AddSpeakerbioToSubmission < ActiveRecord::Migration
  def self.up
    add_column :submissions, :speaker_bio, :text
  end

  def self.down
    remove_column :submissions, :speaker_bio
  end
end
