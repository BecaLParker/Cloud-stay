require 'cloud'

describe Cloud do
  describe '.all' do
    it 'display all the listings' do
      connection = PG.connect(dbname: 'cloud_stay_test')
      user = User.user_create(username: 'Glenn', password: 'Jerusha')
      cloud = Cloud.create(name: 'Cloud Nine', description: 'Lovely property to have a Heavenly Day', price: '49,99', user_id: user.id) 
      Cloud.create(name: 'Cloud Nine NEW', description: 'Lovely property to have a Heavenly Day after the storm', price: '99,99', user_id: user.id)

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
