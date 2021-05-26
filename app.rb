# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'rack'
require './lib/cloud'
require 'sinatra/flash'
require './lib/users'

class CloudStay < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  register Sinatra::Flash
  enable :sessions

  get '/' do
    erb(:'/login/sign_in')
  end

  post '/sessions' do
    user = User.authenticate_user(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect('/clouds')
    else
      flash[:notice] = 'Please check your email or password.'
      redirect('/')
    end
  end

  get '/sign_up' do
    erb(:'/login/new')
  end

  post '/users' do
    user = User.user_create(username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  get '/clouds' do
    @clouds = Cloud.all
    erb :clouds
  end

  post '/clouds' do
    session[:user_id] = user.id
    cloud = Cloud.create(name: params[:name], description: params[:description], price: params[:price], user_id: session[:user_id])
    redirect '/clouds'
  end

  get '/new' do
    erb :new
  end
end
