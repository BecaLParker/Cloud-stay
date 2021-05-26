# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'

feature 'visiting the clouds listing page' do
  before do
    connection = PG.connect(dbname: 'cloud_stay_test')
    connection.exec("INSERT INTO users (username, password) VALUES ('Glenn', 'Jerusha');")
    connection.exec("INSERT INTO clouds (name, description, price, user_id) VALUES ('Cloud Nine', 'Lovely property to have a Heavenly Day', '49,99', 1);")
    connection.exec("INSERT INTO clouds (name, description, price, user_id) VALUES ('Cloud Nine NEW', 'Lovely property to have a Heavenly Day after the storm', '99,99', 1);")
    visit('/clouds')
  end
  # before block and code here for capybara to login first

  it 'shows available clouds' do
    expect(page).to have_table('Available clouds')
    save_and_open_page
    expect(page).to have_content('Cloud Nine')
    expect(page).to have_content('Cloud Nine NEW')
  end

  it 'shows page links' do
    expect(page).to have_button('Add a cloud listing')
    expect(page).to have_link('Sign out', href: '/')
    expect(page).to have_link('Requests', href: '/requests')
  end

  it 'shows boxes for the dates from / to availability' do
    expect(page).to have_field('Available from')
    expect(page).to have_field('Available to')
    expect(page).to have_button('Update')
  end
end
