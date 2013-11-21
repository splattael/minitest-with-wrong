# Disable freedom patches e.g. `1.must_equal 1`
ENV['MT_NO_EXPECTATIONS'] = "1"

gem 'minitest', '5.0.8'
gem 'wrong', '0.7.1'

require 'minitest/autorun'
require 'wrong/adapters/minitest'

Wrong.config.alias_assert :expect

# Make wrong work for MT5
class Minitest::Spec
  include Wrong::Assert
  include Wrong::Helpers
end

describe "expect with wrong" do

  it "expect works" do
    expect { 1 == 1 }
  end

  it "deny works" do
    deny { 1 == 2 }
  end

  it "Object has no freedom patches" do
    deny { 1.respond_to?(:must_equal) }
    assert { rescuing { 1.must_equal 1 }.class == NoMethodError }
  end

end
