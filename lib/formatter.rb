# frozen_string_literal: true

# Formatter class goes through the record of scores and changes 11, 12, 13
# to Jack, Queen, and King
class Formatter

  # This method iterates through the record until it reaches the cards, and then
  # calls to the replace to do the appropriate replacements.
  def nums_to_characters(record)
    record.each do |record_hash|
      record_hash.each do |player, hand|
        hand.each do |card|
          replace(card)
        end
      end
    end
  end

  private

# Replaces the cards
  def replace(card)
    card.each do |suit, number|
      if number == 11
        card[suit] = 'Jack'
      elsif number == 12
        card[suit] = 'Queen'
      elsif number == 13
        card[suit] = 'King'
      end
    end
  end
end
