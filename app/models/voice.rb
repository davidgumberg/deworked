class Voice < ApplicationRecord
  enum style: %i[author editor translator]

  belongs_to :author
  validates_presence_of :author

  belongs_to :work
  validates_presence_of :work

  accepts_nested_attributes_for :author

  def authors_attributes=(authors_attributes)
    authors_attributes.each do |author_attribute|
      author = Author.find_or_create_by(author_attribute)
      authors << author
    end
  end
end
