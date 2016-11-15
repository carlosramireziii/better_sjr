require "better_sjr/version"
require "better_sjr/renderer_extensions"
require "better_sjr/try_catch_statement"
require "better_sjr/railtie"

module BetterSJR
  class << self
    attr_accessor :debug_sjr
  end
end
