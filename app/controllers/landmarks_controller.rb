class LandmarksController < ApplicationController
  set :views, (Proc.new { File.join(root, "../views/landmarks/") })

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :index
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    redirect to("/landmarks/#{@landmark.id}")
  end

  get '/landmarks/new' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
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
