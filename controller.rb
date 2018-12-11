require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/rps_model')
also_reload('./models/*')


get '/' do
  erb (:home)
end

get '/rules' do
  erb (:rules)
end


get '/game/:hand1/:hand2' do
  @hesit = RPSGame.check_win(params[:hand1],params[:hand2])
  erb( :result )
end
