class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits
  end
  
  def slices(number)
    validate(number)    
    digits.chars.map.with_index do |num,idx|
      digits.chars[idx,number] if idx <= digits.length - number
    end.compact.map{|arr| arr.map(&:to_i)}    
  end

  private

  def validate(number)
    raise ArgumentError,'number given is greather than number of digits' unless number <= digits.length
  end
end


