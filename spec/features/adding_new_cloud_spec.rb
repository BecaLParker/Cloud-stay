# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'

feature 'add a new cloud listing' do
  it 'adds a cloud listing' do
    # before block and code here for capybara to login first
    visit('/new')

    expect(page).to have_field('name')
    expect(page).to have_field('description')
    expect(page).to have_field('price')
    expect(page).to have_button('List my cloud')
  end
end
