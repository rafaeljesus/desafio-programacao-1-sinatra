module App
  module Routes
    class Users < Base

      oauth_success = -> do
        self.current_user = User.from_auth!(env['omniauth_hash'])
        if cookies[:oauth_popup]
          cookies[:oauth_popup] = nil
          erb :oauth_popup_close
        end
        json self.current_user
      end

      oauth_failure = -> do
        session.destroy
        halt 422, 'Auth failure'
      end

      oauth_check = -> do
        if current_user?
          session[:oauth_popup] = nil
          json current_user
        else
          json {}
        end
      end

      destroy = -> do
        session[:user_id] = nil
      end

      get '/auth/:provider/callback', &oauth_success
      get '/auth/failure', &oauth_failure
      get '/auth/check/:provider', &oauth_check
    end
  end
end
