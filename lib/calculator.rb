# frozen_string_literal: true

# The Calculator class calulates who's won and returns a single or plural
# statement containing the information.
class Calculator

  # Totals is where the total scores of each player is stored
  # Winning_score keeps track of the top score
  def initialize
    @totals = {}
    @winning_score = 0
  end

  # This method calls to adding_scores and then to find_top_score. It then goes
  # through the totals hash (returned by adding_scores), looking for scores which
  # match the top score. It adds any players who have the top score into the
  # victors array. It calls to the winner_or_winner method and returns the
  # result to the controller.
  def find_winners(record)
    adding_scores(record)
    find_top_score
    victors = []
    @totals.each do |player, total_score|
      victors << player if total_score == @winning_score
    end
    winner_or_winners(victors) #REFACTOR NAME
  end

  # This method returns a single or plural statement about who won, depending
  # if it's a draw or not. 
  def winner_or_winners(victors)
    if victors.length == 1
      'And the winner is: ' + victors.join
    else
      'And the winners are: ' + victors.join(', ')
    end
  end

  private

  # This method goes through the record hash (returned by the dealer class) of
  # all the players and their hands. It adds up the hands of each player and
  # returns the totals hash, which has each player and one score, their total
  # score.
  def adding_scores(record)
    record.each do |record_hash|
      record_hash.each do |player, hand|
        player_total = 0
        hand.each do |card|
          card.each do |_suit, number|
            player_total += number
          end
        end
        @totals[player.to_s] = player_total
      end
    end
  end

  # This method goes through the totals hash(returned by the adding_scores
  # method) and finds what the top score is.
  def find_top_score
    first_winner_array = @totals.max_by do |_player, total_score|
      total_score
    end
    @winning_score = first_winner_array[1]
  end
end
