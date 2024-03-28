# frozen_string_literal: true

class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def points
    case value
    when /\A[2,3,4,5,6,7,8,9]/
      value.to_i
    when /\A[10]|[VDK]/
      10
    when /\AA/
      1
    end
  end
end
