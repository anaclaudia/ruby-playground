class StringCompressor
  def initialize(value)
    @value = value
  end

  def length
    @value.length
  end

  def compress
    @value.strip!

    if @value == ""
      @value
    else
      compressed_value = @value[0]
      count = 0

      split_value.each do |item|
        if compressed_value[-1] != item
          if count > 1
            compressed_value << count.to_s
          end

          compressed_value << item
          count = 1
        else
          count += 1
        end
      end

      # Append count for the last character in the string
      if count != 1
        compressed_value << count.to_s
      end

      compressed_value
    end
  end

  private

  def split_value
    @value.split("")
  end
end
