class Work < ApplicationRecord
  has_many :voices
  has_many :authors, through: :voices
end
