# frozen_string_literal: true

class Player
  attr_accessor :name, :bank, :cards

  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
  end

  def total_points
    arr_points = cards.map(&:points)
    suma = arr_points.sum
    suma += 10 if arr_points.include?(1) && arr_points.sum <= 11
    suma
  end

  def viewing_cards
    cards.map do |card|
      card.value + card.suit
    end
  end
end
