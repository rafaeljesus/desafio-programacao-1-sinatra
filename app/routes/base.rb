module App
  module Routes
    class Base < Sinatra::Application
      configure do
        set :views, 'app/views'
        set :root, File.expand_path('../../../', __FILE__)

        disable :method_override
        disable :protection
        disable :static
        set :erb, escape_html: true

        enable :use_code
      end

      register Extensions::Assets
      register Extensions::Auth

      helpers Helpers
      helpers Sinatra::ContentFor
    end
  end
end
