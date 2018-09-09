class TableFile
  def initialize fileName:
    if File.exist? fileName
      @dataFile = File.new fileName
      @data = Array.new
      self.update
    end
  end

  def update
    unless @dataFile.nil?
      self.extractData
      self.closeFile
    end
  end

  def to_s
    out = ""
    @data.each do |item|
      out += item.to_s + "\n"
    end
    out
  end

  protected
  def extractData
    unless @dataFile.nil?
      headers = @dataFile.gets
      @data[0] = headers.split
      i = 1
      @dataFile.each_line do |line|
        @data[i] = Array.new
        tokens = line.split
        tokenNumb = 0
        @data[0].each do |head|
          unless line[headers.index(head)+head.length-1] == ' '
            if tokens[tokenNumb] == '-'
              tokenNumb += 1
            end
            @data[i] << tokens[tokenNumb]
            tokenNumb += 1
          else
            @data[i] << nil
          end
        end
        i += 1
      end
    end
  end

  def closeFile
    unless @dataFile.nil?
      @dataFile.close
    end
  end
end
