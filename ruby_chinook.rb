require 'sqlite3'

begin
  db = SQLite3::Database.new("Chinook_Sqlite.sqlite")

  # albums = db.execute("select * from album;")

  # p albums.class
  # p albums

  # country_most_money = db.execute("select BillingCountry, max(SalesTotal) from (select distinct BillingCountry, round(sum(Total), 2) as 'SalesTotal' from Invoice group by BillingCountry);")
  # p country_most_money

  # new_artist = db.execute("Insert Into artist (name) Values ('Casper Dongwaffle');")
  # p new_artist

  artist_named_dan = "Dan"
  db.execute("Insert Into artist (name) VALUES ('#{artist_named_dan}')")

  dan_id = db.last_insert_row_id
  p dan_id

  an_id = 277

  all_dans = db.execute "SELECT * FROM artist WHERE name = :artist AND ArtistId = :an_id", artist_named_dan, an_id
  p all_dans



  db.close

  rescue SQLite3::Exception => e
    p "Exception with Database query : #{e}"
end
