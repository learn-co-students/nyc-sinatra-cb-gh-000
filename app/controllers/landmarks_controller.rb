class LandmarksController < ApplicationController
  set :views, (Proc.new { File.join(root, "../views/landmarks/") })

  get '/landmarks' do
    erb :index
  end

  post '/landmarks' do
  end

  get '/landmarks/new' do
    erb :new
  end

  get '/landmarks/:id/edit' do
    erb :edit
  end

  get '/landmarks/:id' do
    erb :show
  end

  patch '/landmarks/:id' do
  end
end
