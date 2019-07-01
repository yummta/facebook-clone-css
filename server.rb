require 'cuba'
require 'cuba/safe'
require 'tilt/erb'

Cuba.use Rack::Session::Cookie, :secret => '__a_very_long_string__'
Cuba.plugin Cuba::Safe

Cuba.use Rack::Static,
  root: "public",
  urls: ["/css"]

Cuba.define do
  on get do
    on root do
      template = Tilt::ERBTemplate.new('views/facebbok.html.erb')
      res.write template.render
    end
  end
end




