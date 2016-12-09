module BetterSJR
  class TryCatchStatement
    attr_accessor :original_code

    def initialize(code)
      @original_code = code
    end

    def wrapped_code
      <<-TRYCATCH
        try {
          #{original_code}
        } catch(e) {
          console.error("Rails SJR error", e);
        }
      TRYCATCH
    end
  end
end
