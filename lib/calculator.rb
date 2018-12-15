class Calculator

 def initialize
   @totals = {}
   @winning_score = 0
 end

  def find_winners(record) #refactor
    adding_scores(record)
    find_top_score
    winners = []
    @totals.each {|player, total_score|
    winners << player if total_score == @winning_score}
    return winners
  end

  def winner_or_winners(result)
    if result.length == 1
      "And the winner is: " + result.join
    else
      "And the winners are: " + result.join(', ')
    end
  end

  private

  def adding_scores(record)
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

  def find_top_score
    first_winner_array = @totals.max_by{|player, total_score|
       total_score
     }
    @winning_score = first_winner_array[1]
  end

end
