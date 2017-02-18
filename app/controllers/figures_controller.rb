class FiguresController < ApplicationController

  get '/figures/new' do 
    erb :'figures/new'
  end

  post '/figures' do
    figure = Figure.new(params[:figure])
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.new(params[:landmark])
    end
    if !params[:title][:name].empty?
      figure.titles << Title.new(params[:title])
    end
    figure.save
    redirect '/figures'
  end

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    if !params[:landmark][:name].empty?
      figure.landmarks << Landmark.new(params[:landmark])
    end
    if !params[:title][:name].empty?
      figure.titles << Title.new(params[:title])
    end
    figure.save
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
end
