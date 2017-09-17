class SignupList < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /.+@.+\..+/, message: "must contain an @ and a ." }, uniqueness: true
end
