# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
SEED_WORKS = [
  {
    title: "Adventures of Huckleberry Finn",
    original_publication_year: 1884,
    original_publication_month: 12,
    original_publication_day: 10,
    cover_url: "https://upload.wikimedia.org/wikipedia/commons/6/61/Huckleberry_Finn_book.JPG",
    voices_attributes: [{
      style: :author,
      author_attributes: { name: "Mark Twain",
                           birth_year: 1835, birth_month: 11, birth_day: 30,
                           death_year: 1910, death_month:  4, death_day: 21 },
    }],
  },
  {
    title: "The Adventures of Tom Sawyer",
    original_publication_year: 1876,
    cover_url: "https://m.media-amazon.com/images/I/51BHNYajx8L.jpg",
    voices_attributes: [{
      style: :author,
      author_attributes: { name: "Mark Twain",
                           birth_year: 1835, birth_month: 11, birth_day: 30,
                           death_year: 1910, death_month:  4, death_day: 21 }
    }],
  },
  {
    title: "Anna Karenina",
    original_publication_year: 1878,
    cover_url: "https://i0.wp.com/www.raptisrarebooks.com/images/126515/anna-karenina-leo-tolstoy-first-edition-rare-russian.jpg",
    voices_attributes: [{
      style: :author,
      author_attributes: { name: "Leo Tolstoy",
                           birth_year: 1828, birth_month:  9, birth_day: 9,
                           death_year: 1910, death_month: 11, death_day: 20 }
    }],
  },
].freeze

SEED_WORKS.each do |params|
  Work.create(params)
end
