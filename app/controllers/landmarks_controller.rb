class LandmarksController < ApplicationController
  set :views, (Proc.new { File.join(root, "../views/landmarks/") })

  get '/landmarks' do
  end

  post '/landmarks' do
  end

  get '/landmarks/new' do
  end

  get '/landmarks/:id/edit' do
  end

  get '/landmarks/:id' do
  end

  patch '/landmarks/:id' do
  end
end
