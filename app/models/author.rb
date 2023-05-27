class Author < ApplicationRecord
  has_many :voices
  has_many :books, through: :voices

  validates_presence_of :first_name

  def name
    if self[:last_name].present?
      self[:first_name] + ' ' + self[:last_name]
    else
      self[:first_name] 
    end
  end

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
