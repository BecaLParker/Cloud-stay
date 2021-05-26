require 'PG'

class Cloud
  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end

  def self.all
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'cloud_stay_test')
                 else
                   PG.connect(dbname: 'cloud_stay')
                 end
    result = connection.exec('SELECT * FROM clouds;')
    result.map do |cloud|
      Cloud.new(
        name: cloud['name'],
        description: cloud['description'],
        price: cloud['price']
      )
    end
  end

  def self.create(name:, description:, price:, user_id:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                  PG.connect(dbname: 'cloud_stay_test')
                else
                  PG.connect(dbname: 'cloud_stay')
                end
    result = connection.exec()
    Cloud.new(name:, description:, price:, user_id:)
  end
end
