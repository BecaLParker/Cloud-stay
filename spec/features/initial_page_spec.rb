# frozen_string_literal: true

require 'capybara/rspec'
require_relative '../../app'

feature 'Connects to siantra and dsiplays page' do
  scenario 'visits the home page' do
    visit('/')
    expect(page).to have_content('Cloud Stay')
  end
  
end
