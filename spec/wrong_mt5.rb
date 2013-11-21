# Wrong adapter for MT5
#
# Adjusted https://github.com/sconover/wrong/blob/ae25366/lib/wrong/adapters/minitest.rb
class Minitest::Spec
  include Wrong::Assert
  include Wrong::Helpers

  def failure_class
    Minitest::Assertion
  end

  # Increment MT's assertion count
  def increment_assertion_count
    self.assertions += 1
  end
end
