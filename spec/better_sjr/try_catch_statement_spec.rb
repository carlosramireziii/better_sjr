require "spec_helper"

describe BetterSJR::TryCatchStatement do
  RSpec::Matchers.define :be_a_try_catch_statement do
    TRY_CATCH_REGEX = /try\s*{\s*.*\s*}\s*catch.*\s*{\s*.*\s*}/

    match do |code_snippet|
      code_snippet =~ TRY_CATCH_REGEX
    end
  end

  describe "#original_code" do
    it "returns the original code passed to the instance" do
      code = "var foo = 'bar';"
      try_catch = BetterSJR::TryCatchStatement.new(code)

      expect(try_catch.original_code).to eq(code)
    end
  end

  describe "#wrapped_code" do
    it "returns original code wrapped in a try-catch statement" do
      original_code = "var foo = 'bar';"
      try_catch = BetterSJR::TryCatchStatement.new(original_code) 

      expect(try_catch.wrapped_code).to be_a_try_catch_statement
    end
  end
end
