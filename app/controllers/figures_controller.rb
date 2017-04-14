require_relative '../helpers/figure_create_helper'
require_relative '../helpers/figure_update_helper'
class FiguresController < ApplicationController

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  post '/figures' do
    @figure = FigureSaveHelper.new(
      Figure.create(name: params[:figure][:name])
    )
    #binding.pry
    @figure.complete_creation(params)
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = FigureUpdateHelper.new(
      Figure.find(params[:id])
    )
    @figure.update(params)
    redirect to "/figures/#{@figure.id}"
  end

end
