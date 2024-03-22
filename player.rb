class Player
  #include BlackJack
  attr_accessor :name, :bank, :ruka

  def initialize(name)
    @name = name
    @bank = 10
    @ruka = []
  end

  def suma_ochkov
    temp_sum = BlackJack::KOL.select do |k, v|
      ruka.include?(k)
    end.values
    suma = temp_sum.sum
    suma += 10 if temp_sum.include?(1) && temp_sum.sum <= 11
    suma
  end

  # def temporary_sum
  #   temp_sum = KOL.select do |k, v|
  #     ruka.include?(k)
  #   end.values
  #   suma = temp_sum.include?(1) ? temp_sum.sum + 10 && suma <= 21 : temp_sum.sum
  # end
end
