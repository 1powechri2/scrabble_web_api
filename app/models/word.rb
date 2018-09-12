class Word
  attr_reader :id,
              :root

  def initialize(attributes)
    @id = attributes[:results].first[:id]
    @root = attributes[:results].first[:lexicalEntries][0][:inflectionOf][0][:id]
  end
end
