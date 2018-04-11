# id SERIAL8 PRIMARY KEY,
# album_name VARCHAR(255),
# artist_id INT REFERENCES artist(id)
require('pg')
require_relative('artist.rb')
class Album

  attr_reader :id
  def initialize(options)
    @id = options['id'].to_i
    @album_name = options['album_name']
  end

   def save
     db = PG.connect({ dbname: "music_collection", host: "localhost" })
     sql = "INSERT INTO albums (album_name) VALUES ($1) RETURNING id;"
     values = [@album_name]
     db.prepare("save", sql)
     result = db.exec_prepared("save", values)
     @id = result[0]['id'].to_i
   end
end
