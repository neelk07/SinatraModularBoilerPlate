require 'rubygems'
require 'bundler'
require "sinatra"
require "sinatra/activerecord"

# Setup load paths
Bundler.require
$: << File.expand_path('../', __FILE__)
$: << File.expand_path('../lib', __FILE__)


# Require base
require 'sinatra/base'

libraries = Dir[File.expand_path('../lib/**/*.rb', __FILE__)]
libraries.each do |path_name|
  require path_name
end

require 'app/extensions'
require 'app/models'
require 'app/helpers'
require 'app/routes'

module Particulr
  class App < Sinatra::Application
    configure do
      set :database, "sqlite3:db/master.db"
    end


    configure do
      disable :method_override
      disable :static

      set :erb, escape_html: true

    end

    use Rack::Deflater
    use Rack::Standards
    #use Routes::Static


    # Other routes:
    use Routes::Base
  end
end

include Particulr::Models