module BetterSJR
  # Wraps JavaScript formatted templates in a try-catch statement when rendered
  module RendererExtensions
    # Overrides default behavior by wrapping rendered content in a try-catch
    # statement.
    #
    # If debugging is enabled and the template is JavaScript format, wrap the
    # rendered content in a try-catch statement.
    #
    # @return [String] the rendered template content
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
