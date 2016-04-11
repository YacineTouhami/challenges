class Cipher

  attr_accessor :key
  ARR = ('a'..'z').to_a

  def initialize(key='aaaaaaaaaa')
    raise ArgumentError , 'Not a valid key' unless key.match(/[a-z]+/)
    @key = key    
  end

  def encode(text)
    res = ''

    text.chars.each_with_index do |char,idx| 

      shift = ARR.index(key[idx]) - ARR.index('a')
      shift_char = ARR.index('z') - ARR.index(char)
      if shift <= shift_char
        res += ARR[ARR.index(char) + shift]
      else
        res += ARR[shift - shift_char - 1]
      end

    end
    res
  end

  def decode(text)
    res = ''

    text.chars.each_with_index do |char,idx| 

      shift = ARR.index(key[idx]) - ARR.index('a')
      shift_char = ARR.index(char) - ARR.index('a')
      res += ARR[shift_char - shift]

      end    
    res
  end

end

