# == Schema Information
# Schema version: 20101203041745
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  encrypted_password :string(255)
#  admin              :boolean
#  user_type          :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  user_organization  :string(255)
#  user_phone         :string(255)
#

require 'digest'

class User < ActiveRecord::Base

  attr_accessor :password
  attr_accessible(:name , :email, :password, :password_confirmation, :user_type, :user_organization, :user_phone)

  has_many :submissions, :dependent => :destroy

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  :presence => true, :length   => { :maximum => 50 }
  validates :user_type,  :presence => true, :length   => { :maximum => 50 }
  validates :email, :presence => true, :format   => { :with => email_regex }, :uniqueness => { :case_sensitive => false }

	validates :user_organization,  :presence => true, :length   => { :maximum => 50 }
	validates :user_phone,  :presence => true, :length   => { :maximum => 20 }

  # Automatically create the virtual attribute 'password_confirmation'.
  validates :password, :presence => true, :confirmation => true, :length => { :within => 6..40 }

  before_save :encrypt_password

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  private

  def encrypt_password
		if(password != nil && password.strip != "")
			self.encrypted_password = encrypt(password)
		end
  end

  def encrypt(string)
    Digest::SHA2.hexdigest(string)
  end


end

