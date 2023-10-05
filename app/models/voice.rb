class Voice < ApplicationRecord
  enum style: %i[author editor translator]

  belongs_to :author
  validates_presence_of :author

  belongs_to :work
  validates_presence_of :work

  validates_uniqueness_of :work_id, scope: %i[author_id style]

  accepts_nested_attributes_for :author

  def voice_attributes=(array)
    debugger
    array.each do |author|
      voice.build(author)
    end
  end

  def author_attributes=(hash)
    if hash.has_key?(:birth) && hash[:birth].present?
      hash[:birth_year] = hash[:birth].year
      hash[:birth_month] = hash[:birth].month
      hash[:birth_day] = hash[:birth].day
      hash.delete(:birth)
    end

    if hash.has_key?(:death) && hash[:death].present?
      hash[:death_year] = hash[:death].year
      hash[:death_month] = hash[:death].month
      hash[:death_day] = hash[:death].day
      hash.delete(:death)
    end

    if new_record?
      self.author = Author.find_or_initialize_by(name: hash[:name],
                                                 birth_era: hash[:birth_era],
                                                 birth_year: hash[:birth_year],
                                                 birth_month: hash[:birth_month],
                                                 birth_day: hash[:birth_day],
                                                 death_era: hash[:death_era],
                                                 death_year: hash[:death_year],
                                                 death_month: hash[:death_month],
                                                 death_day: hash[:death_day])
    end

    self.author.attributes = hash
  end
end
