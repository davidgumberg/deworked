class Author < ApplicationRecord
  has_many :voices, inverse_of: :author, dependent: :delete_all
  has_many :books, through: :voices

  has_one_attached :image

  validates_presence_of :name
  validates_with AuthorValidator

  def birth
    if birth_year == nil
      return nil
    else
      Date.new(birth_year,
               birth_month || 1,
               birth_day || 1)
    end
  end

  def death
    if death_year == nil
      return nil
    else
      Date.new(death_year,
               death_month || 1,
               death_day || 1)
    end
  end

  def birth=(value)
    if value.is_a? Date
      date = value
    elsif value.is_a? String
      date = Date.parse(value)
    else
      raise Exception
    end

    self.birth_year = date.year
    self.birth_month = date.month
    self.birth_day = date.day
  end

  def death=(value)
    if value.is_a? Date
      date = value
    elsif value.is_a? String
      date = Date.parse(value)
    else
      raise Exception
    end

    self.death_year = date.year
    self.death_month = date.month
    self.death_day = date.day
  end

  # TODO : drop this method, it's expected by EditImageComponent
  def image_url
    nil
  end

  def image_url=(url)
    # We don't store image url's, assign a job to grab the image
    StoreImageJob.perform_now(image, url)
  end

  scope :containing, (lambda do |query|
    where("name LIKE ?", "%#{sanitize_sql_like(query)}%")
  end)
end
