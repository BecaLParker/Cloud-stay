require 'pg'


class Database
  def initialize(dbname)
    # @db_user = "postgres"
    # @db_password = "root"
    @db_name = dbname
    @db_connection = PG.connect(:dbname => @db_name)
    puts "Database connection made to: " + dbname
  rescue PG::Error
    puts "DB error1"
  end

  def db_create(query)
    _ = @db_connection.exec(query)
    puts 'Database has been created'
  rescue PG::Error
    puts 'DB error2'
  end

  def db_insert(query)
    _ = @db_connection.exec(query)
    puts 'Item has been added'
  rescue PG::Error
    puts 'DB error3'
  end

  def db_get(query)
    result = @db_connection.exec(query)
    puts 'Item has been found'
    result
  rescue PG::Error
    puts 'DB error4'
  end

  def db_delete(query)
    _ = @db_connection.exec(query)
    puts 'Item has been deleted'
  rescue PG::Error
    puts 'DB error5'
  end
end

# My usage for clarity:
# x = "CREATE TABLE Peeps (id SERIAL PRIMARY KEY, message VARCHAR(280), Timestamp TIMESTAMP NOT NULL, UserID INTEGER);"
# y = "INSERT INTO Peeps (message, Timestamp, UserID) VALUES ('Boris is shit', '(2021-05-22 23:02:32)', '1') RETURNING id, message, Timestamp, UserID"
# z = "SELECT * FROM Peeps"
# peepDB = Database.new("peeps")
# peepDB.db_insert(y)
# peepDB.db_get(z)