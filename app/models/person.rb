class Person < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: { case_sensative: false }
end
