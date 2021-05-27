# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'rack'
require './lib/cloud'
require 'sinatra/flash'
require './lib/users'
require './lib/book'
require './lib/availability'

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
      session[:id] = user.id
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
    redirect '/' 
  end

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have signed out.'
    redirect('/')
  end

  get '/clouds' do
    @user = User.user_find(id: session[:id])
    @clouds = Cloud.all
    erb :clouds
  end

  get '/clouds/:id/cloud/new' do
    @user_id = params[:id]
    erb :new
  end

  post '/clouds/:id/cloud' do
    cloud = Cloud.create(name: params[:name], description: params[:description], price: params[:price], user_id: params[:id])
    redirect '/clouds'
  end

  get '/clouds/:cloud_id/add_availability' do
    @cloud_id = params[:cloud_id]
    #@cloud_name = connection.exec('SELECT name FROM clouds WHERE id = #{params[:cloud_id]};')
    erb:add_availability
  end

  post '/add_availability' do
    Availability.create(start_date: params[:available_from], end_date: params[available_to], cloud_id: @cloud_id)
    redirect '/clouds'
  end

  get '/new' do
    erb :new
  end

  get '/clouds/6/book' do
    @book = Book.create
    erb :book
  end

  post '/available' do
    #for M&J to have fun

#     name: Maria
# description: Cozy place in Galician coast
# price: 40
# available_from: 2021-05-29
# available_to: 2021-05-30
  end

end


# SELECTED * FROM availability(WHERE )