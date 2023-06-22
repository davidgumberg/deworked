require 'fetchworks'

class Work < ApplicationRecord
  has_many :voices, dependent: :delete_all
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

    debugger

    params = { title: ext_data.dig('title'), ISBN: ext_data.try('isbn'),
               edition_publication: date,
               cover_url: ext_data.try('cover').fetch('large', nil) }

    Work.new params
  end

  private
    # E.g. '2010-11-12 or 2010-11'
    def self.date_from_ol_str(string)
      return nil unless string.present?
      array = string.split(/-|\s/).map_with_index do |value|
        if !(string.scan(/\D/).empty?)
      end
      return nil unless array.size = 3
      Date.new(array.fetch(0, 1), array.fetch(1, 1),
               array.fetch(2, 1))
    end
end
