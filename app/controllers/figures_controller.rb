class FiguresController < ApplicationController
  set :views, (Proc.new { File.join(root, "../views/figures/") })

  get '/figures' do
    @figures = Figure.all
    erb :index
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    unless params[:title][:name].empty?
      @title = Title.find_or_create_by(name: params[:title][:name])
      @figure.titles << @title
    end

    unless params[:landmark][:name].empty?
      @landmark = Landmark.find_or_create_by(name: params[:landmark][:name])
      @figure.landmarks << @landmark
    end

    redirect to("/figures/#{@figure.id}")
  end

  get '/figures/new' do
    @figures = Figure.all
    @titles = Title.all
    @landmarks = Landmark.all
    erb :new
  end

  get '/figures/:id/edit' do
    erb :edit
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end

  patch '/figures/:id' do
  end
end