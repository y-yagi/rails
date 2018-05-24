# frozen_string_literal: true

require "support/cop_helper"
require_relative "../../lib/custom_cops/unfreeze_string"

class UnfreezeStringTest < ActiveSupport::TestCase
  include CopHelper

  setup do
    @cop = CustomCops::UnfreezeString.new
  end

  test "rejects unary plus string" do
    inspect_source @cop, "+'abc'"
    assert_offense @cop, "^^^^^^ Do not use unary plus to get an unfrozen string literal."
  end
end
