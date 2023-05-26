class Voice < ApplicationRecord
  belongs_to :author
  belongs_to :work

  enum :style, { primary: 0, authorial: 1, editorial: 2, translatorial: 3 }
end
