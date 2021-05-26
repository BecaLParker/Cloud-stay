class Book

  attr_reader :id, :start_date, :end_date, :cloud_id

  def initialize(id:, start_date:, end_date:, cloud_id:)
    @id = id
    @start_date = start_date
    @end_date = end_date
    @cloud_id = cloud_id
  end

  def self.create(cloud_id: 6)
    if ENV['ENVIRONMENT'] = 'test'
      connection = PG.connect(dbname: 'cloud_stay_test')
    else
      connection = PG.connect(dbname: 'cloud_stay')
    end
    result = connection.exec("SELECT * FROM availability WHERE cloud_id = #{cloud_id};")
    Book.new(
      id: result[0]['id'],
      start_date: result[0]['start_date'],
      end_date: result[0]['end_date'],
      cloud_id: result[0]['cloud_id']
    )    
  end    
end