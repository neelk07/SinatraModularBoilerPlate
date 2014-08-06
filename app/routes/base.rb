module Particulr
  module Routes
    class Base < Sinatra::Application
      configure do
        set :views, 'app/views'
        set :root, App.root

        disable :method_override
        disable :protection
        disable :static

        set :erb, escape_html: true,
                  layout_options: {views: 'app/views/layouts'}

        enable :use_code
      end

       get "/" do
          return "HELLO WORLD!"
       end


      helpers Helpers
    end
  end
end