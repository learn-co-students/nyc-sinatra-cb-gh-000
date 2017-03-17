class ApplicationController < Sinatra::Base
  enable :method_override
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Twitter::Bootstrap::Assets
end
