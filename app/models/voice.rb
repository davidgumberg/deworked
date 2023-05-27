class Voice < ApplicationRecord
  enum :style, { primary: 0, authorial: 1, editorial: 2, translatorial: 3 }

  belongs_to :author
  validates_presence_of :author

  belongs_to :work
  validates_presence_of :work

  accepts_nested_attributes_for :author
end
