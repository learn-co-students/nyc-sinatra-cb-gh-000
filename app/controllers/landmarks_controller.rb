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
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    redirect to("/landmarks/#{@landmark.id}")
  end
end
