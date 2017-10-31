require 'sqlite3'

db = SQLite3::Database.open("Chinook_Sqlite.sqlite")
begin

  # albums = db.execute("select * from album;")
  # p albums

  # country_most_money = db.execute("select BillingCountry, max(SalesTotal) from (select distinct BillingCountry, round(sum(Total), 2) as 'SalesTotal' from Invoice group by BillingCountry);")
  # p country_most_money

  # new_artist = db.execute("Insert Into artist (name) Values ('David Copperfield');")
  # p new_artist

  # artist_named_dan = "Dan"
  # db.execute("Insert Into artist (name) VALUES ('#{artist_named_dan}')")

  # dan_id = db.last_insert_row_id
  # p dan_id
  # an_id = 277

  # all_dans = db.execute "SELECT * FROM artist WHERE name = ? AND ArtistId = ?", artist_named_dan, an_id

  # p all_dans
################
  # name = "Dan"
  # stm = db.prepare "SELECT * FROM artist WHERE name = ?"
  # stm.bind_param 1, name
  # p stm.class
  # rs = stm.execute
  # p rs.class
  # p rs.columns
  # p rs.next

  # stm.close #close the statement
##################

  db.transaction
  db.execute "CREATE table Concerts(ConcertId INTEGER PRIMARY KEY, Venue TEXT)"
  db.execute "INSERT INTO Concerts(Venue) VALUES ('Ryman')"
  db.execute "INSERT INTO Concerts(Venue) VALUES ('Nissan Stadium')"
  db.commit

  db.close

rescue SQLite3::Exception => e
  p "Exception with database query: #{e}"
  db.rollback

end



# begin
#   db = SQLite3::Database.new("Chinook_Sqlite.sqlite")

#   albums = db.execute("select * from album;")

#   p albums.class
#   p albums

#   country_most_money = db.execute("select BillingCountry, max(SalesTotal) from (select distinct BillingCountry, round(sum(Total), 2) as 'SalesTotal' from Invoice group by BillingCountry);")
#   p country_most_money

#   new_artist = db.execute("Insert Into artist (name) Values ('Casper Dongwaffle');")
#   p new_artist

#   artist_named_dan = "Dan"
#   db.execute("Insert Into artist (name) VALUES ('#{artist_named_dan}')")

#   dan_id = db.last_insert_row_id
#   p dan_id

#   an_id = 277

#   all_dans = db.execute "SELECT * FROM artist WHERE name = :artist AND ArtistId = :an_id", artist_named_dan, an_id
#   p all_dans



#   db.close

#   rescue SQLite3::Exception => e
#     p "Exception with Database query : #{e}"
# end
