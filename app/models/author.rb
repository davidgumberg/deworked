class Author < ApplicationRecord
  include DateValidators

  has_many :voices, inverse_of: :author
  has_many :books, through: :voices

  has_one_attached :image

  validates_presence_of :name

  validates :birth, allow_blank: true, 'date_validators/is_not_future': true

  # validates_with AuthorValidator

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
