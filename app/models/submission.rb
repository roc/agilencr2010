# == Schema Information
# Schema version: 20101126054328
#
# Table name: submissions
#
#  id                :integer         not null, primary key
#  title             :string(255)
#  submission_type   :string(255)
#  speaker_bio       :text
#  abstract          :text
#  comments          :text
#  take_away         :string(255)
#  duration          :integer
#  user_id           :integer
#  submission_status :string(255)
#  audience_type     :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Submission < ActiveRecord::Base

  attr_accessible(:title, :submission_type,:speaker_bio, :abstract, :comments,:take_away, :duration, :submission_status, :audience_type)

  belongs_to :user

  validates :title,  :presence => true, :length   => { :maximum => 50 }
  validates :submission_type,  :presence => true, :length   => { :maximum => 50 }
  validates :speaker_bio,  :presence => true
  validates :abstract,  :presence => true
  validates :take_away,  :presence => true
  validates :duration,  :presence => true

	validates :submission_status, :presence => true
	validates :audience_type, :presence => true

	validate :abstract_should_be_correct_length

	def abstract_should_be_correct_length
		word_count = abstract.split.length
		if (word_count < 10 || word_count > 300)
			errors.add(:abstract, "should be between 10 to 300 words")
		end
	end

end
