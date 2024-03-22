require_relative 'black_jack'
require_relative 'player'
require_relative 'card'
puts "Введите имя: "
vname = gets.chomp
people = Player.new(vname)
komputer = Player.new("Diller")
koloda = Cards.new
game = BlackJack.new(people,komputer,koloda)


loop do
  game.start_game

  game.current_state
  puts "1 - Пропустить\n2 - Добавить карту\n3 - Открыть карты"

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
  puts "Ваш счет #{game.players[0].bank}"
  puts "1 - Продолжить игру\n2 - Закончить игру"
  choise1 = gets.chomp.to_i
  case choise1

  when 1
    if game.players[0].bank == 0
      puts "lllll"
    else
      game.next_game
    end
  when 2
    break
  end
end
