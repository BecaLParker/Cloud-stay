# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'rack'
require './lib/cloudstay'

class CloudStay < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Cloud Stay'
  end

  get '/clouds' do
    erb :clouds
  end
end
