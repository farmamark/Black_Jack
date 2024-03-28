# frozen_string_literal: true

class Deck
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 V D K A].freeze
  SUIT = %w[♥ ♠ ♦ ♣].freeze

  attr_accessor :cards

  # def self.deck_cards
  #   CARD_VALUES.map do |x|
  #     SUIT.map do |s|
  #       x + s
  #     end
  #   end.flatten
  # end

  def initialize
    @cards = CARD_VALUES.map do |x|
      SUIT.map do |s|
        x + s
      end
    end.flatten.map do |card|
      Card.new(card[1],card[0])
    end.shuffle
  end

  def new_card(player)
    player.cards << cards.pop
  end

  # def dealing_cards(obj)
  #   new_card(obj)
  #   new_card(obj)
  # end
end
