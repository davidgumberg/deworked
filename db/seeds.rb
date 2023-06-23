# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

SEED_WORKS = [
  {
    title: 'Adventures of Huckleberry Finn',
    original_publication: '1884-12-10',
    cover_url: 'https://upload.wikimedia.org/wikipedia/commons/6/61/Huckleberry_Finn_book.JPG',
    voices_attributes: [{
      style: :author,
      author_attributes: { name: 'Mark Twain',
                           birth: '1835-11-30',
                           death: '1910-04-21' }
    }]
  },
  {
    title: 'The Adventures of Tom Sawyer',
    original_publication: '1876-01-01',
    cover_url: 'https://m.media-amazon.com/images/I/51BHNYajx8L.jpg',
    voices_attributes: [{
      style: :author,
      author_attributes: { name: 'Mark Twain',
                           birth: '1835-11-30',
                           death: '1910-04-21' }
    }]
  },
  {
    title: 'Anna Karenina',
    original_publication: '1878-01-01',
    cover_url: 'https://i0.wp.com/www.raptisrarebooks.com/images/126515/anna-karenina-leo-tolstoy-first-edition-rare-russian.jpg',
    voices_attributes: [{
      style: :author,
      author_attributes: { name: 'Leo Tolstoy',
                           birth: '1828-09-09',
                           death: '1910-11-20' }
    }]
  }
].freeze

SEED_WORKS.each do |params|
  Work.create(params)
end
