require "spec_helper"

describe "Debugging SJR with try-catch" do
  before  { BetterSJR.debug_sjr = true }
  after   { BetterSJR.debug_sjr = false }

  context "for a JS request" do
    it "wraps the response content in a try-catch statement" do
      perform_js_request

      expect(response).to be_successful
      expect(response.body).to be_a_try_catch_statement
    end
  end

  context "for a non-JS request" do
    it "leaves the response unaltered" do
      perform_non_js_request

      expect(response).to be_successful
      expect(response.body).not_to be_a_try_catch_statement
    end
  end

  private

  def dummy_app_route
    # this is a route in the dummy application
    comments_path
  end

  def perform_js_request
    if Rails::VERSION::MAJOR < 5
      # AJAX requests using 'xhr' method are deprecated in Rails 5+
      xhr :post, dummy_app_route
    else
      post dummy_app_route, xhr: true
    end
  end

  def perform_non_js_request
    post dummy_app_route
  end
end
