module BetterSJR
  module RendererExtensions
    def render_template(*)
      TryCatchStatement.new(super)
    end

    def debugging_sjr?
      BetterSJR.debug_sjr
    end

    def rendering_js?
      lookup_context.rendered_format.to_s == "js"
    end
  end
end
