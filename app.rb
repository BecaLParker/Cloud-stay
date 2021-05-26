# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'rack'
require './lib/cloud'

class CloudStay < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Cloud Stay'
  end

  get '/clouds' do
    @clouds = Cloud.all
    erb :clouds
  end
end
