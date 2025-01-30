class Question < ApplicationRecord
  has_many :answers
  validates :username, :username, presence: true
end
