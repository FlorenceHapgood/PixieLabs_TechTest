class Calculator

 def initialize
   @totals = {}
   @winners = [] #necessary?
 end

  def find_winner(record) #refactor
    adding(record)
    @first_winner_array = @totals.max_by{|player, total_score|
       total_score
     }

     @winning_score = @first_winner_array[1]

     @totals.each {|player, total_score|
     @winners << player if total_score == @winning_score}

     return @winners
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



  def winner_or_winners(winners)
    if winners.length == 1
      "And the winner is:"
    else
      "And the winners are:"
    end
  end

end
