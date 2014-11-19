module App
  module Routes
    class CurrentUser < Base

      index = -> do
        binding.pry
        hash = {
          signed_in: current_user?,
          name: current_user.name,
          email: current_user.email
        }
        json hash
      end

      get '/current_user', &index
    end
  end
end
