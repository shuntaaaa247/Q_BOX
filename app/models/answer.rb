class Answer < ApplicationRecord
  belongs_to :question
  validates :username, :question, presence: true
end
