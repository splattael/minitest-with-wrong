# Disable freedom patches e.g. `1.must_equal 1`
ENV['MT_NO_EXPECTATIONS'] = "1"

gem 'minitest', '5.0.8'
gem 'wrong', '0.7.1'

require 'minitest/autorun'
require 'wrong/assert'
require 'wrong/helpers'

Wrong.config.alias_assert :expect

require_relative 'wrong_mt5'

describe "expect with wrong" do

  it "expect works" do
    expect { 1 == 1 }
  end

  it "deny works" do
    deny { 1 == 2 }
  end

  it "Object has no freedom patches" do
    deny { 1.respond_to?(:must_equal) }
  end

  it "assert_equal still works" do
    assert_equal 1, 1
  end

end
