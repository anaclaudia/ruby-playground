class StringCompressor
  def initialize(value)
    @value = value
  end

  class StringError < StandardError
    attr_accessor :msg

    def initialize(msg="Default message")
      @msg = msg
    end
  end

  def length
    @value.length
  end

  def compress
    begin
      if @value.class == String
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
            end # end of if statement
          end # end of each

          # Append count for the last character in the string
          if count != 1
            compressed_value << count.to_s
          end
          compressed_value
        end
      else
        raise StringError.new("Non string received, please inform a string")
      end
    rescue StringError => err
      err.msg
    end
  end


  private
  def split_value
    @value.split("")
  end
end
