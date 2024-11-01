class Email < ApplicationRecord
  validates :content, presence: true
  validates :to, presence: true
end
