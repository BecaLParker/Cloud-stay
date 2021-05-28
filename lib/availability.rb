require 'PG'
require_relative 'cloud'

class Availability # Added id returning from database!
  attr_reader :cloud_id, :start_date, :end_date, :id

  def initialize(id:, cloud_id:, start_date:, end_date:)
    @cloud_id = cloud_id
    @start_date = start_date
    @end_date = end_date
    @id = id
  end

  def self.create(cloud_id:, start_date:, end_date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'cloud_stay_test')
    else
      connection = PG.connect(dbname: 'cloud_stay')
    end
    result = connection.exec("INSERT INTO availability (start_date, end_date, cloud_id) VALUES('#{start_date}', '#{end_date}', '#{cloud_id}') RETURNING id, start_date, end_date, cloud_id;")
    # result = connection.exec("SELECT * FROM availability WHERE cloud_id = #{cloud_id};")
     Availability.new(
      id: result[0]['id'],
      start_date: result[0]['start_date'],
      end_date: result[0]['end_date'],
      cloud_id: result[0]['cloud_id']
    )    
  end    

  def self.find(cloud_id:)
    connection =  if ENV['ENVIRONMENT'] == 'test'
                    PG.connect(dbname: 'cloud_stay_test')
                  else
                    PG.connect(dbname: 'cloud_stay')
                  end
                  return nil unless cloud_id

    result = connection.exec("SELECT * FROM availability WHERE id = #{cloud_id}")
      Availability.new(
        start_date: result[0]['start_date'],
        end_date: result[0]['end_date'],
        cloud_id: result[0]['cloud_id']
    )  
  end
end