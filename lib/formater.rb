class Formater

  def nums_to_characters(record)
     record.map { |record_hash|
       record_hash.each {| player, hand|
           hand.each {|card|
               replace(card)

      }
    }
  }

  end

  private
  
  def replace(card)
    card.each {|suit, number|
      if number == 11
        card[suit] = "Jack"
      elsif number == 12
        card[suit] = "Queen"
      elsif number == 13
        card[suit] = "King"
      end
    }
  end

end
