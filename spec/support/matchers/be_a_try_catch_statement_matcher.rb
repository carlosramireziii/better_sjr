class TryCatchRegex
  REGEX = /try\s*{\s*.*\s*}\s*catch.*\s*{\s*.*\s*}/

  def self.match?(value)
    value =~ REGEX
  end
end

RSpec::Matchers.define :be_a_try_catch_statement do
  match do |code_snippet|
    TryCatchRegex.match?(code_snippet)
  end
end

