class Person < ApplicationRecord
  has_secure_password
  has_many :tasks

  validates :email, uniqueness: { case_sensative: false }
end
