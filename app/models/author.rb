class Author < ApplicationRecord
  has_many :voices
  has_many :books, through: :voices

  validates_presence_of :name
  # validates :birth, comparison: { less_than_or_equal_to: Time.now }
  # validates :death, comparison: { less_than_or_equal_to: Time.now }

  scope :containing, (lambda do |query|
    where("name LIKE ?", "%#{sanitize_sql_like(query)}%")
  end)

  def birth_string
    if self[:birth].present?
      self[:birth].strftime('%m/%d/%Y')
    else
      'N/A'
    end
  end

  def death_string
    if self[:death].present?
      self[:death].strftime('%m/%d/%Y')
    else
      'N/A'
    end
  end
end
