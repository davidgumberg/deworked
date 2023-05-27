class Author < ApplicationRecord
  has_many :voices
  has_many :books, through: :voices

  validates_presence_of :first_name
end
