
require 'pg'

def persisted_data(table:, id:)
  connection = PG.connect(dbname: 'cloud_stay_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end

def available_insert(cloud_id:, start_date:, end_date:)
  connection = PG.connect(dbname: 'cloud_stay_test')
  result = connection.exec("INSERT INTO availability (start_date, end_date, cloud_id) VALUES('#{start_date}', '#{end_date}', #{cloud_id}) RETURNING id, start_date, end_date, cloud_id;")
end

