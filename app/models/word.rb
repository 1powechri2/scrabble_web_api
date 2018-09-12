class Word
  attr_reader :id,
              :root
              
  def initialize(attributes)
    @id = attributes[:results].first[:id]
    @root = attributes[:results].first[:lexicalEntries][1][:inflectionOf].first[:id]
  end
end
