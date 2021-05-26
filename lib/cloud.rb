require 'PG'

class Cloud
  attr_reader :name, :description, :price

  def initialize(name:, description:, price:)
    @name = name
    @description = description
    @price = price
  end

  def self.all 
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'cloud_stay_test')
    else
      connection = PG.connect(dbname: 'cloud_stay')
    end
      result = connection.exec("SELECT * FROM clouds;")
      result.map do |cloud|
        Cloud.new(
        name: cloud['name'],
        description: cloud['description'],
        price: cloud['price']
        )
    end
  end
end