class Possession < ApplicationRecord
  belongs_to :user
  belongs_to :work
end
