class Possession < ApplicationRecord
  belongs_to :user
  validates_presence_of :user

  belongs_to :work
  validates_presence_of :work

  validates_uniqueness_of :work_id, scope: :user_id
end
