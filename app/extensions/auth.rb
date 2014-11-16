module App
  module Extensions
    module Auth extend self
      module Helpers

        def current_user_from_session
          user_id = session[:user_id]
          user_id && User[user_id]
        end

        def current_user= user
          session[:user_id] = user && user.id
        end

        def current_user
          @current_user ||= current_user_from_session
        end

        def registered app
          app.helpers = Helpers
        end
      end
    end
  end
end
