load "TableFile.rb"
load "DataTable.rb"

class WeatherData

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
    @data_table = @table.generate_data_table(name_col: 0, value_one_col: 1, value_two_col: 2)
  end
end
