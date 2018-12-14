class Calculator

 def initialize
   @totals = {}
 end

  def find_winner(record)
    adding(record)
    top_score = 0
    winner = ""
    @winner = @totals.max_by{
      |key, value| value
    }
    return @winner[0]
  end

  def adding(record)
    @totals = {}
    record.each { |record_hash|
    record_hash.each {| player_key, array_values|

    player_total = 0
    array_values.each {|hash|
    hash.each {|key, value|
    player_total += value }
  }
  @totals["#{player_key}"] = player_total

}
}
return @totals
end

end
