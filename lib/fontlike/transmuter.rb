module Fontlike
  class Transmuter
    attr_accessor :upper_base, :lower_base

    CHAR_BASE = {
      fancy: {upper: [0x1D4D0], lower: [0x1D4EA]},
      shout: {upper: ['A'.ord], lower: ['A'.ord]},
      mono: {upper: [120432], lower: [120458]},
      sans_serif: {upper: [120224], lower: [120250]},
      circle: {upper: [0xFEFF, 0x24B6], lower: [0xFEFF, 0x24D0]},
      double_struck: {upper: [120120], lower: [120146]},
    }

    DEFAULT_BASE = CHAR_BASE.fetch(:double_struck)

    ALL_CHAR_BASE_UPPER = CHAR_BASE.values.map {|v| v.fetch(:upper)}
    ALL_CHAR_BASE_LOWER = CHAR_BASE.values.map {|v| v.fetch(:lower)}

    def initialize(options)
      if options[:style] == :random
        self.upper_base = lambda { ALL_CHAR_BASE_UPPER.sample }
        self.lower_base = lambda { ALL_CHAR_BASE_LOWER.sample }
      else
        up = CHAR_BASE.fetch(options[:style], DEFAULT_BASE).fetch(:upper)
        lw = CHAR_BASE.fetch(options[:style], DEFAULT_BASE).fetch(:lower)

        self.upper_base = lambda { up }
        self.lower_base = lambda { lw }
      end
    end

    def transmute(str)
      str.split("").map do |char|
        if char.match(/[A-Z]/)
          *prefix, suffix = upper_base.call
          last = suffix + char.ord - 'A'.ord
          [*prefix, last].pack('U*')
        elsif char.match(/[a-z]/)
          *prefix, suffix = lower_base.call
          last = suffix + char.ord - 'a'.ord
          [*prefix, last].pack('U*')
        else
          char
        end
      end.join("")
    end
  end
end
