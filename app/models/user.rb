module App
  module Models
    class User < Sequel::Model

      def self.from_auth! auth
        user          = self.new
        user.uid      = auth[:uid]
        user.provider = auth[:provider]
        user.name     = auth[:info][:name]
        user.save
        user
      end

    end
  end
end
