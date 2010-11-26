# == Schema Information
# Schema version: 20101126054328
#
# Table name: submissions
#
#  id                :integer         not null, primary key
#  title             :string(255)
#  submission_type   :string(255)
#  abstract          :text
#  comments          :text
#  duration          :integer
#  user_id           :integer
#  submission_status :string(255)
#  audience_type     :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

class Submission < ActiveRecord::Base

  attr_accessible(:title, :submission_type, :abstract, :comments, :duration, :submission_status, :audience_type)

  belongs_to :user

  validates :title,  :presence => true, :length   => { :maximum => 50 }
  validates :submission_type,  :presence => true, :length   => { :maximum => 50 }
  validates :abstract,  :presence => true
  validates :duration,  :presence => true
	validates_numericality_of :duration, :only_integer => true
	validates :submission_status, :presence => true
	validates :audience_type, :presence => true

	validate :abstract_should_be_correct_length

	def abstract_should_be_correct_length
		word_count = abstract.split.length
		if (word_count < 150 || word_count > 300)
			errors.add(:abstract, "Abstract should be between 150 to 300 words")
		end
	end

end
