require 'cloud'

describe Cloud do
  describe '.all' do
    it 'display all the listings' do
      connection = PG.connect(dbname: 'cloud_stay_test')
      connection.exec("INSERT INTO users (username, password) VALUES ('Glenn', 'Jerusha');")
      connection.exec("INSERT INTO clouds (name, description, price, user_id) VALUES ('Cloud Nine', 'Lovely property to have a Heavenly Day', '49,99', 1);")
      connection.exec("INSERT INTO clouds (name, description, price, user_id) VALUES ('Cloud Nine NEW', 'Lovely property to have a Heavenly Day after the storm', '99,99', 1);")

      clouds = Cloud.all

      expect(clouds.first.name).to eq 'Cloud Nine'
      expect(clouds.first.description).to eq 'Lovely property to have a Heavenly Day'
      expect(clouds.first.price).to eq '49,99'
      expect(clouds.length).to eq(2)
    end
  end

  describe '.create' do
    it 'adds a new cloud' do
      connection = PG.connect(dbname: 'cloud_stay_test')
      # user = connection.exec("INSERT INTO users (username, password) VALUES ('Jenny', 'pass123');")
      user = User.user_create(username: 'jenny@mail.com', password: 'pass123')
      cloud = Cloud.create(name: 'Created Cloud', description: 'A fantastic cloud', price: '45.50', user_id: user.id)

      expect(cloud).to be_a Cloud
      expect(cloud.name).to eq 'Created Cloud'
      expect(cloud.description).to eq 'A fantastic cloud'
      expect(cloud.price).to eq '45.50'
      expect(cloud.user_id).to eq user.id
    end
  end
end
