class Work < ApplicationRecord
  has_many :voices
  has_many :authors, through: :voices

  validates_presence_of :title

  accepts_nested_attributes_for :voices, reject_if: :all_blank, allow_destroy: false
end
