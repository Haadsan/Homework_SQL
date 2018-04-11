require('pry')
require_relative('Models/album.rb')
require_relative('Models/artist.rb')
# CREATE TABLE albums (
#   id SERIAL PRIMARY KEY,
#   album_name VARCHAR(255)
# );
#
# CREATE TABLE artists (
#   id SERIAL PRIMARY KEY,
#   first_name VARCHAR(255),
#   last_name VARChAR(255),
#   album_id INT REFERENCES albums(id)
# );

album_1 = Album.new({
  "album_name" => "Chris"
  })

album_1.save

album_2 = Album.new({
  "album_name" => "Bens wonderland"
  })

album_2.save

artist_1 = Artist.new({
    "first_name" => "Chris",
    "last_name" => "Marshall",
    "album_id" => album_1.id
  })

artist_1.save

# artist_2 = Artist.new({
#     "first_name" => "Ben",
#     "last_name" => "Carsen",
#     "album_id" => album_2.id
#   })
#
# artist_2.save


binding.pry
nil
