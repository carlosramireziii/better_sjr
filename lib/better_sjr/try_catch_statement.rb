module BetterSJR
  # Wraps a given code snippet in a JavaScript try-catch statement
  class TryCatchStatement
    # @return [String] the code without a try-catch statement surrounding it
    attr_accessor :original_code

    # Returns a new instance of TryCatchStatement
    #
    # @param code [String] the code to be surrounded by a try-catch statement
    def initialize(code)
      @original_code = code
    end

    # Wraps the original code in a try-catch statement
    #
    # @return [String] the try-catch statement
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
