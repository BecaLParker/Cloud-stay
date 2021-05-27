require 'pg'

def setup_test_database
  p 'Setting up database...'
  connection = PG.connect(dbname: 'cloud_stay_test')
  connection.exec('TRUNCATE clouds, users, booking, availability;')
end
