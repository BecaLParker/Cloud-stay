require 'PG'

class Cloud
  attr_reader :name, :description, :price, :user_id

  def initialize(name:, description:, price:, user_id:)
    @name = name
    @description = description
    @price = price
    @user_id = user_id
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
        price: cloud['price'],
        user_id: cloud['user_id']
      )
    end
  end

  def self.create(name:, description:, price:, user_id:)
    connection = if ENV['ENVIRONMENT'] == 'test'
                  PG.connect(dbname: 'cloud_stay_test')
                else
                  PG.connect(dbname: 'cloud_stay')
                end
    result = connection.exec("INSERT INTO clouds (name, description, price, user_id) VALUES('#{name}', '#{description}', '#{price}', #{user_id}) RETURNING id, name, description, price, user_id;")
    result = Cloud.new(
      name: result[0]['name'], 
      description: result[0]['description'], 
      price: result[0]['price'], 
      user_id: result[0]['user_id']
    )
  end
end
