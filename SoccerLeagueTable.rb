load "TableFile.rb"
load "DataTable.rb"

class SoccerLeagueTable

  def initialize file_name:
    @table = TableFile.new file_name: file_name
    self.fill_data_table
  end

  def update
    @table.update
    self.fill_data_table
  end

  def minimum_difference
    unless @data_table.empty?
      return @data_table.minimum_difference
    end
  end

  protected

  def fill_data_table
    @data_table = DataTable.new
    @table.data.each do |row|
      unless row[0].to_i == 0
        @data_table.add_row(name: row[1], value_one: row[6], value_two: row[7])
      end
    end
  end
end
