module Fontlike
  class Transmuter
    attr_accessor :upper_base, :lower_base

    def initialize(options)
      if options[:fancy]
        self.upper_base = [0x1D4D0]
        self.lower_base = [0x1D4EA]
      elsif options[:shout]
        self.upper_base = ['A'.ord]
        self.lower_base = ['A'.ord]
      elsif options[:mono]
        self.upper_base = [120432]
        self.lower_base = [120458]
      elsif options[:sans_serif]
        self.upper_base = [120224]
        self.lower_base = [120250]
      elsif options[:circle]
        self.upper_base = [0xFEFF, 0x24B6]
        self.lower_base = [0xFEFF, 0x24D0]
      else
        self.upper_base = [120120]
        self.lower_base = [120146]
      end
    end

    def transmute(str)
      str.split("").map do |char|
        if char.match(/[A-Z]/)
          *prefix, suffix = upper_base
          last = suffix + char.ord - 'A'.ord
          [*prefix, last].pack('U*')
        elsif char.match(/[a-z]/)
          *prefix, suffix = lower_base
          last = suffix + char.ord - 'a'.ord
          [*prefix, last].pack('U*')
        else
          char
        end
      end.join("")
    end
  end
end
