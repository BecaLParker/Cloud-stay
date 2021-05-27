require 'book'

feature 'booking a stay' do
  scenario 'a user can select a date to stay in a cloud' do
  
    user = User.user_create(username: "Becs", password: "1234")
    cloud = Cloud.create(name: "Becca", description: "Very nice place", price: "50", user_id: user.id)
    visit('/clouds/:cloud_id/book')
    book = Book.create(cloud_id: cloud.id, start_date: "2021-05-05", end_date: "2021-06-05")
  
    p book

    expect(page).to have_content('Make a booking')
    expect(page).to have_content('You may book from 2021-05-05')
    expect(page).to have_content('Until 2021-06-05')
  end
end

# display in text start day and end day
# have calendar to pick a day
# output that day to (somewhere)