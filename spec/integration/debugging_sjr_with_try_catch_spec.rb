require "spec_helper"

describe "Debugging SJR with try-catch" do
  before  { BetterSJR.debug_sjr = true }
  after   { BetterSJR.debug_sjr = false }

  context "for a JS request" do
    it "wraps the response content in a try-catch statement" do
      post comments_path, xhr: true

      expect(response).to be_successful
      expect(response.body).to be_a_try_catch_statement
    end
  end

  context "for a non-JS request" do
    it "leaves the response unaltered" do
      post comments_path

      expect(response).to be_successful
      expect(response.body).not_to be_a_try_catch_statement
    end
  end
end

