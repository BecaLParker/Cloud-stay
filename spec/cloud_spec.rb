describe Cloud do
  describe '.all' do
    it 'display all the listings' do
      connection = PG.connect(dbname: 'cloud_stay_test')
      connection = "INSERT INTO user (username, password) VALUES ("Glenn", "Jerusha");"
      connection = "INSERT INTO clouds (name, description, price, user_id) VALUES ("Cloud Nine", "Lovely property to have a Heavenly Day", "49,99", 1);"
      connection = "INSERT INTO clouds (name, description, price, user_id) VALUES ("Cloud Nine NEW", "Lovely property to have a Heavenly Day after the storm", "99,99", 1);"
 
      expect()
    end
  end
end
