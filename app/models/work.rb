require 'fetchworks'
require 'timeliness'

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
  end

  private
    # Timeliness formats initialized in config/initializer/timeliness.rb
    # E.g. '2010-11-12 or 2010-11'
    def self.date_from_ol_str(string)
      Timeliness.parse(string)&.to_date
    end
end
