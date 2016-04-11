class PigLatin

  def self.translate(words)
    result = ''
    words.split(' ').each do |word|      
      if word.match(/^[aeiouyx][^aeiou]/)
        word = word + 'ay'
      else
        conson = ''
        word.each_char do |char|        
          break if ['a','e','i','o','u'].include? char
          conson += char 
        end
        conson += 'u' if word.match(/^.*qu/)         
        word = word.sub!("#{conson}",'') + conson + 'ay'
      end
      result += word + ' '      
    end 
    result.sub(/\s$/,'')
  end
end
