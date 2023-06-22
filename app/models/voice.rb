class Voice < ApplicationRecord
  enum style: %i[author editor translator]

  belongs_to :author
  validates_presence_of :author

  belongs_to :work
  validates_presence_of :work

  accepts_nested_attributes_for :author
end
