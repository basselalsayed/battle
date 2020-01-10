class Game 

    attr_reader :players, :player_1, :player_2
    
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @players = [player_1, player_2]
  end

  def attack(player = victim)
    player.receive_damage
    switch_turn
  end


  #   turn(:player_1) if @moves.empty?

  #   if @turn == player_name(:player_1)
  #     @players[:player_2].receive_damage
  #     add_turn(:player_1)
  #     turn(:player_2)
  #   else
  #     @players[:player_1].receive_damage
  #     add_turn(:player_2)
  #     turn(:player_1)
  #   end
  # end

  def attacker
    @players.first
  end

  def victim
    @players.last
  end

  def switch_turn
    @players.rotate!
  end

end