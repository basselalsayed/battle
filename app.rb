require 'sinatra/base'
require './lib/attack'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  before do
    @game = Game.instance
  end

  get '/' do 
    erb :index
  end
  
  post '/names' do
    @game = Game.create(Player.new(params[:player_1_name]), Player.new(params[:player_2_name]))
    redirect to('/play')
  end

  get '/play' do
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    @player_1_hp = @game.player_1.hitpoints
    @player_2_hp = @game.player_2.hitpoints
    erb :play
  end

  get '/attack' do
    @player_1_name = @game.player_1.name
    @player_2_name = @game.player_2.name
    @game = @game
    Attack.run(@game.victim)
    @game.switch_turn
    if @game.finish? 
      redirect '/game_over'
    end
    redirect '/play'
  end

  get '/game_over' do
    @game = @game
    erb :game_over
  end
# start the server if ruby file executed directly
  run! if app_file == $0
end
