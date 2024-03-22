require_relative 'black_jack'
require_relative 'player'
require_relative 'card'
puts 'Введите имя: '
vname = gets.chomp
people = Player.new(vname)
komputer = Player.new('Diller')
koloda = Cards.new
game = BlackJack.new(people, komputer, koloda)

loop do
  game.validate
  game.start_game

  game.current_state
  puts "\n1 - Пропустить\n2 - Добавить карту\n3 - Открыть карты"

  choise = gets.chomp.to_i
  case choise
  when 1
    game.hod_dillera
    game.rezultat
  when 2
    game.karta_3
    game.hod_dillera
    game.rezultat
  when 3
    game.hod_dillera
    game.rezultat
  end
  puts "\nВаш счет #{game.players[0].bank}"
  puts "1 - Продолжить игру\n2 - Закончить игру"
  choise1 = gets.chomp.to_i
  game.next_game if choise1 == 1
  break if choise1 == 2
rescue RuntimeError => e
  puts e.message
  puts "\n1 - Хотите сыграть в кредит\n2 - Закончить игру"
  choise2 = gets.chomp.to_i
  game.next_game_kredit if choise2 == 1
  break if choise2 == 2
end
puts 'Спасибо за игру'
