class DataRow

  def initialize name:, value_one:, value_two:
    @name = name
    @value_one = value_one
    @value_two = value_two
  end

  def difference
    (@value_two-@value_one).abs
  end

  def to_s
    '[' + @name + ', ' + @value_one.to_s + ', ' + @value_two.to_s + ']'
  end
end
