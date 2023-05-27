class Work < ApplicationRecord
  has_many :voices
  has_many :authors, through: :voices

  accepts_nested_attributes_for :authors, reject_if: :all_blank, allow_destroy: false
end
