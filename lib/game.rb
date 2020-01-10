class Game 

  attr_reader :players, :player_1, :player_2
  
  def self.create(player_1, player_2)
    @game = Game.new(player_1, player_2)
  end
  
  def self.instance
    @game
  end
  
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @players = [player_1, player_2]
  end
  
  def attack(player = victim)
    player.receive_damage
  end

  def attacker
    @players.first
  end

  def victim
    @players.last
  end

  def switch_turn
    @players.rotate!
  end

  def finish?
    @player_1.hitpoints == 0 || @player_2.hitpoints == 0
  end
end
