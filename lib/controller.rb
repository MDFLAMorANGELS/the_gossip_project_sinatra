require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new' do
    erb :new_gossip
  end

  post '/gossips/new' do
    time = Time.now.strftime("%Y-%m-%d %H:%M")
    Gossip.new(params["gossip_author"], params["gossip_content"],time).save
    redirect '/'
  end

end
