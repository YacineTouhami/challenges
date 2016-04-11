class Translation

  CODONS_PROTEINS = {'AUG'=> 'Methionine',
                     'UUU'=>'Phenylalanine','UUC'=>'Phenylalanine',
                     'UUA'=>'Leucine','UUG'=>'Leucine',
                     'UCU'=>'Serine', 'UCC'=>'Serine', 'UCA'=>'Serine', 'UCG'=>'Serine',
                     'UAU'=>'Tyrosine','UAC'=>'Tyrosine',
                     'UGU'=>'Cysteine', 'UGC'=>'Cysteine',
                     'UGG'=>'Tryptophan',
                     'UAA'=>'STOP', 'UAG'=>'STOP', 'UGA'=>'STOP'
                   }

  def self.of_codon(codon)
    CODONS_PROTEINS[codon]
  end

  def self.of_rna(strand)
    arr = rna_to_arr_of_codons(strand)
    validate(arr)
    arr_of_codons_to_protein(arr)
  end

  private

  def self.rna_to_arr_of_codons(strand)
    arr_of_codons = []
    codon = ''
    strand.chars.each_with_index do |char, idx|
        codon += char
        if codon.length == 3
          break if CODONS_PROTEINS[codon] == 'STOP'
          arr_of_codons << codon 
          codon = ''
        end      
    end
    arr_of_codons
  end

  def self.arr_of_codons_to_protein(arr)
    CODONS_PROTEINS.values_at(*arr)
  end

  def self.validate(arr)
    raise InvalidCodonError , 'Not valid rna' unless arr.all? { |codon| CODONS_PROTEINS.keys.include? codon}
  end

end
class InvalidCodonError < StandardError; end

