require 'sinatra/base'
require 'sinatra/reloader'
require 'rack'
require './lib/cloud'
require 'sinatra/flash'
require './lib/users'
require './lib/book'
require 'pg'
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
      flash[:notice] = 'The username and/or password provided do not match the parameters held. Please try again.'
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
    Cloud.create(name: params[:name], description: params[:description], price: params[:price], user_id: params[:id])
    redirect '/clouds'
  end

  get '/clouds/:id/add_availability/new' do
    @cloud_id = params[:id]
    erb :add_availability
  end

  post '/clouds/:id/add_availability' do
    Availability.create(start_date: params[:available_from], end_date: params[:available_to], cloud_id: params[:id])
    redirect '/clouds'
  end

  # get '/new' do
  #   erb :new
  # end

  # post '/clouds/:id/book' do
  #   @cloud_id = params[:id]
  #   redirect '/clouds/:id/book/new'
  # end

  get '/clouds/:id/book/new' do
    @cloud_id = params[:id]
    @available = Availability.find(cloud_id: params[:id])
    erb :book
  end

  post '/clouds/:id/book' do
    @cloud_id = params[:id]
    book = Book.create(start_date: params[:start_date], end_date: params[:end_date], cloud_id: params[:id])
    redirect '/confirmation'
  end

  get '/confirmation' do
    erb :confirmation
  end
  
end

