class FiguresController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets

  get '/figures' do
    erb :'figures/index'
  end

  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures' do
    figure = Figure.create(params["figure"])
    unless params["landmark"]["name"].empty?
      figure.landmarks.create(params["landmark"])
    end
    unless params["title"]["name"].empty?
      figure.titles.create(params["title"])
    end
    redirect "/figures/#{figure.id}"
  end

  post '/figures/:id' do
    figure = Figure.find(params[:id])
    figure.update(params["figure"])
    unless params["landmark"]["name"].empty?
      figure.landmarks.create(params["landmark"])
    end
    unless params["title"]["name"].empty?
      figure.titles.create(params["title"])
    end
    redirect "/figures/#{figure.id}"
  end
end
