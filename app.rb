require 'sinatra'
require 'sinatra/base'
require './lib/game'
	
class RPS < Sinatra::Base
	enable :sessions
	  get '/' do
	    erb :first
    end

    get '/play-one' do
      erb :index
    end

    get '/play-two' do
      erb :game2
    end
    
    post '/name' do
      session[:name_message] = params[:player]
      redirect '/play'
    end

    post '/name-two' do
      session[:name1_message] = params[:player]
      session[:name2_message] = params[:player2]
      redirect '/playplay'
    end

    get '/play' do
      @name = session[:name_message]
	    erb :play
    end

    get '/playplay' do
      @name1 = session[:name1_message]
      @name2 = session[:name2_message]
	    erb :playplay
    end
    
    post '/move' do
      game = Game.new(params[:movee])
      session[:win_message] = game.score
      session[:option] = game.give_image(game.option)
      session[:user] = game.give_image(game.users_choice)
      redirect '/score'
    end

    post '/move-two' do
      game = Game.new(params[:move1], params[:move2])
      session[:win_message] = game.score
      session[:second_player] = game.give_image(game.option)
      session[:first_palyer] = game.give_image(game.users_choice)
      redirect '/score-two'
    end

    get '/score' do
      @message = session[:win_message]
      @option = session[:option]
      @choice = session[:user]
      erb :score
    end

    get '/score-two' do
      @message = session[:win_message]
      @option = session[:second_player]
      @choice = session[:first_palyer]
      erb :score2
    end

	  # start the server if ruby file executed directly
	  run! if app_file == $0
end