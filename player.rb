# frozen_string_literal: true

class Player
  attr_accessor :name, :bank, :hand

  def initialize(name)
    @name = name
    @bank = 100
    @hand = []
  end

  def total_points
    arr_points = hand.map do |x|
      case x.card[0]
      when /\A[2,3,4,5,6,7,8,9]/
        x.card[0].to_i
      when /\A[10]|[VDK]/
        10
      when /\AA/
        1
      end
    end
    suma = arr_points.sum
    suma += 10 if arr_points.include?(1) && arr_points.sum <= 11
    suma
  end

  def card_in_hand
    hand.map(&:card)
  end
end
