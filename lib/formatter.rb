# frozen_string_literal: true

class Formatter
  def nums_to_characters(record)
    record.each do |record_hash|
      record_hash.each do |_player, hand|
        hand.each do |card|
          replace(card)
        end
      end
    end
  end

  private

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
