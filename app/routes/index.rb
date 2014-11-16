module App
  module Routes
    class Index < Base
      index = -> { erb :index }
      get '/', &index
    end
  end
end
