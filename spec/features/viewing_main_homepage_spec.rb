# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'

feature 'visiting the clouds listing page' do
      # before block and code here for capybara to login first

  it 'shows available clouds' do
    visit('/clouds')
    expect(page).to have_table('Available clouds')
    expect(page).to have_content('Cloud nine')
  end

  it 'shows page links' do
    visit('/clouds')
    expect(page).to have_button('Add a cloud listing')
    expect(page).to have_link('Sign out', href: '/')
    expect(page).to have_link('Requests', href: '/requests')
  end

  it 'shows boxes for the dates from / to availability' do
    visit('/clouds')
    expect(page).to have_field('Available from')
    expect(page).to have_field('Available to')
    expect(page).to have_button('Update')
  end
end
