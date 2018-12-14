class Calculator

 def initialize
   @totals = {}
 end

  def find_winner(record)
    adding(record)
    @winner = @totals.max_by{
      |player, total_score| total_score
    }
    return @winner[0]
  end

  def adding(record)
    record.each { |record_hash|
      record_hash.each {| player, hand|
        player_total = 0
        hand.each {|card|
          card.each {|suit, number|
            player_total += number
          }
        }
        @totals["#{player}"] = player_total
      }
    }
  end

end
