feature 'booking a stay' do
  scenario 'a user can select a date to stay in a cloud' do
    visit('/cloud/6/book')
    expect(page).to have_content('Make a booking')
  end
end