$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "better_sjr"

require "combustion"
Combustion.path = "spec/dummy"
Combustion.initialize! :action_controller, :action_view

require "rspec/rails"

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end
