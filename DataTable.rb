load "DataRow.rb"

class DataTable

  def initialize
    @table = Array.new
  end

  def add_row name:, value_one:, value_two:
    @table << DataRow.new(name: name, value_one: value_one.to_i, value_two: value_two.to_i)
  end

  def empty?
    @table.empty?
  end

  def minimum_difference
    unless @table.nil?
      min_difference = Array.new
      min_difference << @table[0]
      begining = true

      @table.each do |row|
        if min_difference[0].difference > row.difference
          min_difference.clear
          min_difference << row
        elsif min_difference[0].difference == row.difference
          min_difference << row
        end

        if begining
          min_difference.pop
          begining = false
        end
      end

      min_difference
    end
  end

  def to_s
    out = ""
    @table.each do |row|
      out += row.to_s + "\n"
    end
    out
  end
end
