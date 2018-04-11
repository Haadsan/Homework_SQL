# id SERIAL8 PRIMARY KEY,
# first_name VARCHAR(255),
# last_name VARChAR(255)
require('pg')

class Artist

  attr_reader :id

  def initialize(options)
    @id = options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @album_id = options['album_id']
  end

  def save
    db = PG.connect({ dbname: "music_collection", host: "localhost" })
    sql =  "INSERT INTO artists (first_name, last_name, album_id) VALUES ($1, $2, $3) RETURNING id;"
    values = [@first_name, @last_name, @album_id]
    db.prepare("save", sql)
    db.exec_prepared("save", values)
    db.close
  end

end
