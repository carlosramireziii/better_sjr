require "rails"

module BetterSJR
  # Makes BetterSJR behavior available to Rails apps on initialization
  class Railtie < Rails::Railtie
    initializer "better_sjr.initialize" do
      ActiveSupport.on_load(:action_view) do
        require "better_sjr/on_load_action_view"
      end
    end
  end
end
