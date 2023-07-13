require 'fetchworks'
require 'timeliness'

# Timeliness formats initialized in config/initializer/timeliness.rb

class Work < ApplicationRecord
  has_many :voices, inverse_of: :work, dependent: :delete_all
  has_many :authors, through: :voices

  validates_presence_of :title

  accepts_nested_attributes_for :voices, reject_if: :all_blank,
                                         allow_destroy: true

  def self.new_from_isbn(isbn)
    ext_work = OpenLibraryBook.new(isbn.strip)
    return nil unless ext_work
    
    ext_data = ext_work.data

    ext_authors = ext_work.authors_details

    voices = ext_authors.map do |author|
      { style: :author,
        author_attributes: { name: author.dig('personal_name'),
                             birth: date_from_ol_str(author.dig('birth_date')),
                             death: date_from_ol_str(author.dig('death_date'))}
        }
    end

    date = date_from_ol_str(ext_data.dig('publish_date'))

    params = { title: ext_data.dig('title'), ISBN: ext_data.dig('isbn'),
               edition_publication: date,
               cover_url: ext_data.dig('cover', 'large'),
               voices_attributes: voices }

    params
  end

  def original_publication=(val)
    if val.is_a?(Date)
      super(val)
    end

    if val.is_a?(Array) && val.first.is_a?(Hash)
      hash = val.first
    elsif val.is_a?(HashWithIndifferentAccess)
      hash = val
    else
      p "Something went wrong with value for original_publication"
      p "Val.class.name #{val.class.name}"
      super(val)
    end

    hash = hash.transform_values(&:to_i)

    super(Date.new(hash.dig(:year), hash.fetch(:month, 1), hash.fetch(:day, 1)))
  end

  private
    # E.g. '2010-11-12 or 2010-11'
    def self.date_from_ol_str(string)
      Timeliness.parse(string)&.to_date
    end
end
