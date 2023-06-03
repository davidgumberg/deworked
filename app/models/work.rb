require 'date'
require 'fetchworks'

class Work < ApplicationRecord
  has_many :voices, :dependent => :delete_all
  has_many :authors, through: :voices

  validates_presence_of :title

  accepts_nested_attributes_for :voices, reject_if: :all_blank,
                                         allow_destroy: true

  def self.new_from_isbn(isbn)
    ext_data = OpenLibraryBook.new(isbn)
    return nil unless ext_data

    authors = ext_data.authors_details

    # E.g. '2010-11-12 or 2010-11'
    date_array = ext_data.publish_date.split('-').map(&:to_i)

    date = DateTime.new(date_array.fetch(0, 1), date_array.fetch(1, 1),
                        date_array.fetch(2, 1))

    Work.new(title: ext_data.title, ISBN: isbn,
             date_published: date,
             cover_url: ext_data.cover['large'])
  end
end
