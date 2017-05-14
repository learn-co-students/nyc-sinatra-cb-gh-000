class FiguresController < ApplicationController
  set :views, (Proc.new { File.join(root, "../views/figures/") })

  get '/figures' do
    erb :index
  end

  post '/figures' do
  end

  get '/figures/new' do
    erb :new
  end

  get '/figures/:id/edit' do
    erb :edit
  end

  get '/figures/:id' do
    erb :show
  end

  patch '/figures/:id' do
  end
end