# frozen_string_literal: true

module CustomCops
  class UnfreezeString < RuboCop::Cop::Cop
    MSG = 'Do not use unary plus to get an unfrozen string literal.'.freeze

    def_node_matcher :unary_plus_string?, <<-PATTERN
      (send {str dstr} :+@)
    PATTERN

    def on_send(node)
      add_offense(node) if unary_plus_string?(node)
    end
  end
end
