
require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'cloud_stay_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end

