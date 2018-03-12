class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    # binding.pry
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  get '/figures' do
    @all = Figure.all
    erb :'figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    unless params[:title][:name].empty?
      # @title = Title.find_or_create_by(params[:title])
      @figure.titles.create(params[:title])
      # FigureTitle.create(title_id: @title.id)
    end

    unless params[:landmark][:name].empty?
      @landmark = Landmark.find_or_create_by(params[:landmark])
      @landmark.update(figure_id: @figure.id)
    end

    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  post '/figures/:id' do
    # binding.pry
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      # @title = Title.find_or_create_by(params[:title])
      @figure.titles.create(params[:title])
      # FigureTitle.create(title_id: @title.id)
    end

    unless params[:landmark][:name].empty?
      @landmark = Landmark.find_or_create_by(params[:landmark])
      @landmark.update(figure_id: @figure.id)
    end
    # binding.pry
    redirect to "/figures/#{@figure.id}"
  end
end
