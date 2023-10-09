require 'fetchworks'

class Work < ApplicationRecord
  enum :original_publication_era, {BC: -1, AD: 1}, prefix: true
  enum :edition_publication_era, {BC: -1, AD: 1}, prefix: true

  has_many :voices, inverse_of: :work, dependent: :delete_all
  has_many :authors, through: :voices

  has_many :possessions, inverse_of: :work, dependent: :delete_all
  has_many :users, through: :possessions

  has_one_attached :cover_image

  validates_presence_of :title

  accepts_nested_attributes_for :voices, reject_if: :all_blank,
                                         allow_destroy: true

  # Generate array of options for sorting selector
  def self.options_for_sort_select
    [
      ["Default", :default],
      ["Original Publication Date", :original_publication_date],
      ["Edition Publication Date", :edition_publication_date],
      ["Title", :title]
    ]
  end

  # Gets Date object from separate columns
  def original_publication
    if original_publication_year.nil?
      return nil
    else
      true_year =
        if original_publication_era_BC?
          -original_publication_year
        else
          original_publication_year
        end
      Date.new(true_year,
               original_publication_month || 1,
               original_publication_day || 1)
    end
  end

  # Gets Date object from separate columns
  def edition_publication
    if edition_publication_year.nil?
      return nil
    else
      true_year =
        if edition_publication_era_BC?
          -edition_publication_year
        else
          edition_publication_year
        end
      Date.new(true_year,
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
      return
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
      return
    end

    self.edition_publication_year = date.year
    self.edition_publication_month = date.month
    self.edition_publication_day = date.day
  end

  # Enqueue a job to grab the image from url, hotlink in the meantime.
  def cover_url=(url)
    StoreImageJob.perform_now(cover_image, url)

    super
  end

  def self.sort(params)
    order =
      if params[:order] == :desc || params[:order] == "desc"
        :desc
      else
        :asc
      end
    
    original_publication_era_attr = Work.arel_table[:original_publication_era]
    original_publication_year_attr = Work.arel_table[:original_publication_year]
    original_publication_month_attr = Work.arel_table[:original_publication_month]
    original_publication_day_attr = Work.arel_table[:original_publication_day]

    edition_publication_era_attr = Work.arel_table[:edition_publication_era]
    edition_publication_year_attr = Work.arel_table[:edition_publication_year]
    edition_publication_month_attr = Work.arel_table[:edition_publication_month]
    edition_publication_day_attr = Work.arel_table[:edition_publication_day]

    case params[:sort]
    when "default"
      Work.all
    when "original_publication_date"
      Work.order(original_publication_era_attr * original_publication_year_attr
                  .send(order).nulls_last,
                 original_publication_month_attr.send(order).nulls_last,
                 original_publication_day_attr.send(order).nulls_last)
    when "edition_publication_date"
      Work.order(edition_publication_era_attr * edition_publication_year_attr
                  .send(order).nulls_last,
                 edition_publication_month_attr.send(order).nulls_last,
                 edition_publication_day_attr.send(order).nulls_last)
    when "title"
      Work.order(title: order)
    else
      Work.all
    end
  end

  def self.new_from_isbn(isbn)
    ext_work = OpenLibraryBook.new(isbn.strip)
    return nil unless ext_work

    ext_authors = ext_work.authors_details

    # we should iterate through all the authors on a work,
    # but there is an ongoing bug with openlibrary where
    # dozens of irrelevant authors are listed for one work
    # voices = ext_authors.map do |author|
    author = ext_authors.first
    begin
      ext_birth = author.birth_date
    rescue OpenLibrary::OLDateStrUnparseable
      ext_birth = nil
    end
    begin
      ext_death = author.death_date
    rescue OpenLibrary::OLDateStrUnparseable
      ext_death = nil
    end
    voices = [
      { style: :author,
        author_attributes: { name: author.personal_name,
                             birth_year: ext_birth&.year,
                             birth_month: ext_birth&.month,
                             birth_day: ext_birth&.day,

                             death_year: ext_death&.year,
                             death_month: ext_death&.month,
                             death_day: ext_death&.day
                           }
      }
    ]

    begin
      ext_publish_date = ext_work.publish_date
    rescue OpenLibrary::OLDateStrUnparseable
      ext_publish_date = nil
    end

    { title: ext_work.title, ISBN: isbn,
      edition_publication_year: ext_publish_date&.year,
      edition_publication_month: ext_publish_date&.month,
      edition_publication_day: ext_publish_date&.day,
      cover_url: ext_work.cover["large"],
      voices_attributes: voices }
  end
end
