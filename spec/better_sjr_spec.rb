require "spec_helper"

describe BetterSJR do
  it "has a version number" do
    expect(BetterSJR::VERSION).not_to be nil
  end

  it { is_expected.to respond_to(:debug_sjr) }
  it { is_expected.to respond_to(:debug_sjr=) }
end
