require 'book'
require 'cloud'
require 'users'

describe '.create' do
  it 'creates a new booking'do
  user = User.user_create(username: "Becs", password: "1234")
  cloud = Cloud.create(name: "Becca", description: "Very nice place", price: "50", user_id: user.id)
  book = Book.create(cloud_id: cloud.id, start_date: "2021-05-05", end_date: "2021-06-05")

  
  expect(book.start_date).to eq("2021-05-05")
  expect(book.end_date).to eq("2021-06-05")
  expect(book.cloud_id).to eq(cloud.id)

  end
end