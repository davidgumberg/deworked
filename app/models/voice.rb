class Voice < ApplicationRecord
  enum style: %i[author editor translator]

  belongs_to :author
  validates_presence_of :author

  belongs_to :work
  validates_presence_of :work

  accepts_nested_attributes_for :author
  
  def voice_attributes=(array)
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

    self.author = Author.find_or_initialize_by(hash)
  end

end
