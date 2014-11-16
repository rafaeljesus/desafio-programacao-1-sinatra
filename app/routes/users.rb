module App
  module Routes
    class Users < Base

      oauth_callback = -> do
        self.current_user = User.from_auth!(env['omniauth_hash'])
        json self.current_user
      end

      oauth_failure_callback = -> do
        session.destroy
        halt 422, 'Auth failure'
      end

      get '/auth/:provider/callback', &oauth_callback
      get '/auth/failure', &oauth_failure_callback
    end
  end
end
