require "spec_helper"


describe BetterSJR::RendererExtensions do
  let(:template) { "template content" }
  let(:renderer) { DummyRenderer.new(template) }

  describe "#debugging_sjr?" do
    it "returns true when debugging is enabled" do
      allow(BetterSJR).to receive(:debug_sjr).and_return(true)

      expect(renderer).to be_debugging_sjr
    end

    it "delegates to BetterSJR.debug_sjr" do
      allow(BetterSJR).to receive(:debug_sjr).and_return(true)

      renderer.debugging_sjr?

      expect(BetterSJR).to have_received(:debug_sjr)
    end
  end

  describe "#rendering_js?" do
    it "returns true when rendered format is JS" do
      stub_lookup_context(renderer, :js)
      expect(renderer).to be_rendering_js
    end

    it "returns false when rendered format is not JS" do
      stub_lookup_context(renderer, :html)

      expect(renderer).not_to be_rendering_js
    end

    it "understands rendered format as symbol" do
      stub_lookup_context(renderer, :js)

      expect(renderer).to be_rendering_js
    end

    it "understands rendered format as string" do
      stub_lookup_context(renderer, "js")

      expect(renderer).to be_rendering_js
    end
  end

  describe "#render_template" do
    it "wraps the template content in a try-catch statement" do
      allow(BetterSJR::TryCatchStatement).to receive(:new)

      renderer.render_template

      expect(BetterSJR::TryCatchStatement).to(
        have_received(:new).
        with(template)
      )
    end
  end

  private

  def stub_lookup_context(renderer, rendered_format)
    double("lookup_context", rendered_format: rendered_format).tap do |context|
      allow(renderer).to receive(:lookup_context).and_return(context)
    end
  end

  class DummyRenderer < Struct.new(:template)
    prepend BetterSJR::RendererExtensions

    def render_template
      template.to_s
    end
  end
end
