class Author < ApplicationRecord
  has_many :voices
  has_many :books, through: :voices
end
