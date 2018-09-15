class TableFile

  def initialize file_name:
    if File.exist? file_name
      self.create_file file_name: file_name
      @data = Array.new
      self.update
    end
  end

  def update
    unless @data_file.nil?
      self.create_file file_name: @file_name
      self.extract_data
      self.close_file
    end
  end

  def data
    @data
  end

  def to_s
    out = ""
    @data.each do |item|
      out += item.to_s + "\n"
    end
    out
  end

  protected

  def extract_data
    unless @data_file.nil?
      headers = @data_file.gets
      @data[0] = headers.split
      row = 1
      @data_file.each_line do |line|
        @data[row] = Array.new
        tokens = line.split
        token_numb = 0
        @data[0].each do |head|
          unless line[headers.index(head)+head.length-1] == ' '
            if tokens[token_numb] == '-'
              token_numb += 1
            end
            @data[row] << tokens[token_numb]
            token_numb += 1
          else
            @data[row] << nil
          end
        end
        row += 1
      end
    end
  end

  def create_file file_name:
    @file_name = file_name
    @data_file = File.new file_name
  end

  def close_file
    unless @data_file.nil?
      @data_file.close
    end
  end
end
