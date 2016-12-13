require "better_sjr/version"
require "better_sjr/renderer_extensions"
require "better_sjr/try_catch_statement"
require "better_sjr/railtie"

# Facilitates better debugging of Rails SJR templates
module BetterSJR
  class << self
    # Controls whether or not debugging behavior is enabled
    # @return [Boolean] value
    attr_accessor :debug_sjr
  end
end
