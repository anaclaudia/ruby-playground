class Palindrome
  def initialize(value)
    @value = value
  end

  def palindrome?
    return true if @value == "" || @value.length == 1

    @value = @value.delete(" ")
    @value = @value.split("")

    while @value.length > 1 do
      if @value[0] == @value[-1]
        @value.shift
        @value.pop

        if @value.length == 1 || @value.empty?
          return true
        end
      else
        return false
      end
    end
  end
end
