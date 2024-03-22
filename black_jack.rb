class BlackJack
  KOL = {
    '2♥' => 2, '3♥' => 3, '4♥' => 4, '5♥' => 5, '6♥' => 6, '7♥' => 7, '8♥' => 8,
    '9♥' => 9, '10♥' => 10, 'J♥' => 10, 'D♥' => 10, 'K♥' => 10, 'A♥' => 1, '2♠' => 2,
    '3♠' => 3, '4♠' => 4, '5♠' => 5, '6♠' => 6, '7♠' => 7, '8♠' => 8, '9♠' => 9, '10♠' => 10,
    'J♠' => 10, 'D♠' => 10, 'K♠' => 10, 'A♠' => 1, '2♦' => 2, '3♦' => 3, '4♦' => 4,
    '5♦' => 5, '6♦' => 6, '7♦' => 7, '8♦' => 8, '9♦' => 9, '10♦' => 10, 'J♦' => 10, 'D♦' => 11,
    'K♦' => 10, 'A♦' => 1, '2♣' => 2, '3♣' => 3, '4♣' => 4, '5♣' => 5, '6♣' => 6, '7♣' => 7,
    '8♣' => 8, '9♣' => 9, '10♣' => 10, 'J♣' => 10, 'D♣' => 10, 'K♣' => 10, 'A♣' => 1
  }
  attr_accessor :players, :cards

  def initialize(pl, pl2, kol)
    @players = [pl, pl2]
    @cards = kol
  end

  def current_state
    puts "\nИгрок: #{players[0].name}. На счету: #{players[0].bank}"
    puts "Игрок: #{players[1].name}.  На счету: #{players[1].bank}"
    puts 'Банк: 20'
    puts "Карты диллера: #{'*' * players[1].ruka.count}"
    puts "Ваши карты: #{players[0].ruka}\nСумма очков: #{players[0].suma_ochkov}"
  end

  def start_game
    cards.razdacza(players[0].ruka)
    cards.razdacza(players[1].ruka)
    players[0].bank -= 10
    players[1].bank -= 10
  end

  def hod_dillera
    cards.nowa_karta(players[1].ruka) if players[1].suma_ochkov <= 17
  end

  def karta_3
    cards.nowa_karta(players[0].ruka)
  end

  def rezultat
    puts "Карты диллера: #{players[1].ruka}\nСумма очков: #{players[1].suma_ochkov}"
    puts "Ваши карты: #{players[0].ruka}\nСумма очков: #{players[0].suma_ochkov}"
    puts '=' * 10
    a = players[1].suma_ochkov
    b = players[0].suma_ochkov
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
    # raise "bla" if players[0].bank == 0
    self.cards = Cards.new
    players[0].ruka.clear
    players[1].ruka.clear
  end

  def next_game_kredit
    next_game
    players[0].bank += 100
  end

  def validate
    raise 'У вас кончились деньги' if players[0].bank == 0
    raise 'Вы уже всё выграли, у диеллера нет денег' if players[1].bank == 0
  end
end
