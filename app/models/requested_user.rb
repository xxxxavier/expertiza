class RequestedUser < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_save { self.name }
  attr_accessible :name, :role_id, :fullname, :institution_id, :email, :status, :introduction, :self_introduction
  validates :name, presence: true, length: {maximum: 50, message: "is too long"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255, message: "is too long"},
                    format: {with: VALID_EMAIL_REGEX, message: "format is wrong"},
                    uniqueness: {case_sensitive: false, message: "has already existed in Expertiza"}

  validates :fullname, presence: true, length: {maximum: 100, message: "is too long"}
end
