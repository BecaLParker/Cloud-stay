require 'availability'
require 'cloud'
require 'users'

describe '.create' do
  it 'creates a new availability'do
  user = User.user_create(username: "James@mail.com", password: "1234")
  cloud = Cloud.create(name: "James", description: "Very cool place", price: "60", user_id: user.id)
  availability = Availability.create(cloud_id: cloud.id, start_date: "2021-05-05", end_date: "2021-06-05")

  expect(availability.start_date).to eq("2021-05-05")
  expect(availability.end_date).to eq("2021-06-05")
  expect(availability.cloud_id).to eq(cloud.id)
  end
end