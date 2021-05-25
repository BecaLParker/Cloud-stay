# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'

feature 'viewing available clouds' do
  scenario 'visits the clouds page' do
    # code here for capybara to login first
    visit('/clouds')
    expect(page).to have_button('Add a cloud listing')
    expect(page).to have_table('Available clouds')
    expect(page).to have_content('Cloud nine')
    # expect(page).to have_link('Sign out', href: 'http://www.makersacademy.com')
    # expect(page).to have_link('Requests', href: 'http://www.makersacademy.com')
    # expect(page).to have_link('Clouds', href: 'http://www.makersacademy.com')


  end


end
