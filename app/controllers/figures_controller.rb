class FiguresController < ApplicationController
  get "/figures" do
    @figures = Figure.all

    erb :"figures/index"
  end

  get "/figures/new" do
    @landmarks = Landmark.all
    @titles = Title.all

    erb :"figures/new"
  end

  get "/figures/:id" do
    @figure = Figure.find(params[:id])

    erb :"figures/show"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all

    erb :"figures/edit"
  end

  post "/figures" do
    figure = Figure.new(params[:figure])
    figure.landmarks << Landmark.new(params[:landmark]) if !params[:landmark][:name].empty?
    figure.titles << Title.new(params[:title]) if !params[:title][:name].empty?
    figure.save

    redirect "/figures"
  end

  patch "/figures/:id" do
    figure = Figure.find(params[:id])
    figure.update(params[:figure])
    figure.landmarks << Landmark.new(params[:landmark]) if !params[:landmark][:name].empty?
    figure.titles << Title.new(params[:title]) if !params[:title][:name].empty?
    figure.save

    redirect "/figures/#{figure.id}"
  end
end
