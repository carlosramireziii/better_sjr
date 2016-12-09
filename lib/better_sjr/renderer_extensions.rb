module BetterSJR
  module RendererExtensions
    def render_template(*)
      if debugging_sjr? && rendering_js?
        TryCatchStatement.new(super).wrapped_code
      else
        super
      end
    end

    def debugging_sjr?
      BetterSJR.debug_sjr
    end

    def rendering_js?
      lookup_context.rendered_format.to_s == "js"
    end
  end
end
