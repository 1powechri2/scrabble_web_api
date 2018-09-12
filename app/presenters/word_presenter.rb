class WordPresenter
  def initialize(word)
    @word = word
    @service = DictionaryService.new(word)
  end

  def validation_message
    if @service.response_body == nil
      "'#{@word}' is not a valid word."
    else
      word = Word.new(@service.response_body)
      "'#{word.id}' is a valid word and its root form is '#{word.root}'."
    end
  end
end
