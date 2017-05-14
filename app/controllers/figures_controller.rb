class FiguresController < ApplicationController
  set :views, (Proc.new { File.join(root, "../views/figures/") })

  get '/figures' do
  end

  post '/figures' do
  end

  get '/figures/new' do
  end

  get '/figures/:id/edit' do
  end

  get '/figures/:id' do
  end

  patch '/figures/:id' do
  end
end