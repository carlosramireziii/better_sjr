class TryCatchValidator
  TRY_CATCH_FORMAT_REGEX = /try\s*{\s*.*\s*}\s*catch.*\s*{\s*.*\s*}/

  attr_accessor :code, :error_handler_code

  def initialize(code, error_handler_code)
    @code = code
    @error_handler_code = error_handler_code
  end

  def valid?
    format_is_valid? && has_error_handler?
  end

  def format_is_valid?
    code =~ TRY_CATCH_FORMAT_REGEX
  end

  def has_error_handler?
    return true if error_handler_code.blank?

    handler_regex = error_handler_regex_for(error_handler_code)
    code =~ handler_regex
  end

  def error_handler_regex_for(code)
    escaped_code = Regexp.escape(code)
    /catch.*\s*{\s*#{escaped_code}\s*/
  end
end

RSpec::Matchers.define :be_a_try_catch_statement do
  match do |code_snippet|
    TryCatchValidator.new(code_snippet, error_handler).valid?
  end

  failure_message do |actual|
    "".tap do |message|
      message << "expected that: \n\n#{actual}\n"\
                 "would be a try-catch statement"
      if error_handler.present?
        message << " with error handler: \n\n#{error_handler}\n"
      end
    end
  end

  failure_message_when_negated do |actual|
    "".tap do |message|
      message << "expected that: \n\n#{actual}\n"\
                 "would not be a try-catch statement"
      if error_handler.present?
        message << " with error handler: \n\n#{error_handler}\n"
      end
    end
  end

  chain :with_error_handler, :error_handler
end
