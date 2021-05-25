# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'

feature 'viewing available clouds' do
  scenario 'visits the clouds page' do
    # code here for capybara to login first
    visit('/clouds')
    expect(page).to have_content('Cloud nine')
    expect(page).to have_button('Add a cloud listing')
  end


end
