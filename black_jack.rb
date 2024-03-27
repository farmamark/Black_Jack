# frozen_string_literal: true

class BlackJack
  attr_accessor :players, :cards

  def initialize(pl, pl2, kol)
    @players = [pl, pl2]
    @cards = kol
  end

  def current_state
    puts "\nИгрок: #{players[0].name}. На счету: #{players[0].bank}"
    puts "Игрок: #{players[1].name}.  На счету: #{players[1].bank}"
    puts 'Банк: 20'
    puts "Карты диллера: #{'*' * players[1].card_in_hand.count}"
    puts "Ваши карты: #{players[0].card_in_hand}\nСумма очков: #{players[0].total_points}"
  end

  def start_game
    cards.dealing_cards(players[0].hand)
    cards.dealing_cards(players[1].hand)
    players[0].bank -= 10
    players[1].bank -= 10
  end

  def dealer_action
    cards.new_card(players[1].hand) if players[1].total_points <= 17
  end

  def third_card
    cards.new_card(players[0].hand)
  end

  def results_game
    puts "Карты диллера: #{players[1].card_in_hand}\nСумма очков: #{players[1].total_points}"
    puts "Ваши карты: #{players[0].card_in_hand}\nСумма очков: #{players[0].total_points}"
    puts '=' * 10
    a = players[1].total_points
    b = players[0].total_points
    if a > b && a <= 21 || b > 21
      puts 'Выйграл Diller'
      players[1].bank += 20
    elsif a < b && b <= 21
      puts 'Вы выйграли'
      players[0].bank += 20
    elsif a == b && b <= 21
      puts 'Ничья'
      players[0].bank += 10
      players[1].bank += 10
    end
  end

  def next_game
    self.cards = Deck.new
    players[0].hand.clear
    players[1].hand.clear
  end

  def next_game_kredit
    next_game
    players[0].bank += 100
  end

  def validate
    raise 'У вас кончились деньги' if players[0].bank.zero?
    raise 'Вы уже всё выграли, у диеллера нет денег' if players[1].bank.zero?
  end
end
