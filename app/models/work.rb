require 'fetchworks'
require 'timeliness'

class Work < ApplicationRecord
  has_many :voices, inverse_of: :work, dependent: :delete_all
  has_many :authors, through: :voices

  validates_presence_of :title

  accepts_nested_attributes_for :voices, reject_if: :all_blank,
                                         allow_destroy: true

  def original_publication
    if original_publication_year == nil
      return nil
    else
      Date.new(original_publication_year, 
               original_publication_month || 1,
               original_publication_day || 1)
    end
  end


  def edition_publication
    if edition_publication_year == nil
      return nil
    else
      Date.new(edition_publication_year, 
               edition_publication_month || 1,
               edition_publication_day || 1)
    end
  end

  def original_publication=(value)
    if value.is_a? Date
      date = value
    elsif value.is_a? String
      date = Date.parse(value)
    else
      raise StandardError
    end

    self.original_publication_year = date.year
    self.original_publication_month = date.month
    self.original_publication_day = date.day
  end

  def edition_publication=(value)
    if value.is_a? Date
      date = value
    elsif value.is_a? String
      date = Date.parse(value)
    else
      raise StandardError
    end

    self.edition_publication_year = date.year
    self.edition_publication_month = date.month
    self.edition_publication_day = date.day
  end

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


    params = { title: ext_data.dig('title'), ISBN: isbn,
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
