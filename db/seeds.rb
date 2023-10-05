# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])

SEED_WORKS = [
  {
    title: "Difficult Loves",
    ISBN: "0156260557",
    original_publication_year: 1970,
    edition_publication_year: 1985,
    cover_url: "https://pictures.abebooks.com/isbn/9780151256105-es.jpg",
    voices_attributes: [{
      style: :author,
      author_attributes: { name: "Italo Calvino",
                           image_url: "https://upload.wikimedia.org/wikipedia/commons/9/97/Italo-Calvino.jpg",
                           birth_year: 1923, birth_month: 10, birth_day: 15,
                           death_year: 1985, death_month:  9, death_day: 19 },
    }],
  },
  {
    title: "Another Country",
    ISBN: "9780679744719",
    original_publication_year: 1962,
    edition_publication_year: 1992, edition_publication_month: 12, edition_publication_day: 1,
    cover_url: "https://ia800604.us.archive.org/view_archive.php?archive=/1/items/olcovers42/olcovers42-L.zip&file=420618-L.jpg",
    voices_attributes: [{
      style: :author,
      author_attributes: { name: "James Baldwin",
                           image_url: "https://upload.wikimedia.org/wikipedia/commons/f/f3/James_Baldwin_37_Allan_Warren_%28cropped%29.jpg",
                           birth_year: 1924, birth_month: 8, birth_day: 2,
                           death_year: 1987, death_month:  12, death_day: 1 }
    }],
  },
  {
    title: "Canterbury Tales",
    ISBN: "9780679409892",
    original_publication_year: 1400,
    edition_publication_year: 1992, edition_publication_month: 6, edition_publication_day: 30,
    cover_url: "https://m.media-amazon.com/images/I/A1dB5MSocdL._SL1500_.jpg",
    voices_attributes: [{
      style: :author,
      author_attributes: { name: "Geoffrey Chaucer",
                           image_url: "https://upload.wikimedia.org/wikipedia/commons/5/57/Chaucer_manuscrit_portrait_%28d%C3%A9tail%29.jpeg",
                           birth_year: 1340,
                           death_year: 1400, death_month: 10, death_day: 25 }
    }],
  },
].freeze

SEED_WORKS.each do |params|
  Work.create(params)
end
