module App
  module Routes
    autoload :Assets, 'app/routes/assets'
    autoload :Base, 'app/routes/base'
    autoload :Static, 'app/routes/static'
    autoload :Users, 'app/routes/users'
    autoload :Index, 'app/routes/index'
    autoload :CurrentUser, 'app/routes/current_user'
  end
end
