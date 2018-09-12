class WordPresenter
  def initialize(word)
    @word = word
    @service = DictionaryService.new(word)
  end

  def dictionary_response
    @service.response
  end

  def validation_message
    if @service.status == 
  end

  def validation_message
    if dictionary_response.status == 404
      "'#{@word}' is not a valid word."
    else
      word_json = JSON.parse(dictionary_response.body, symbolize_names: true)
      word = Word.new(word_json)
      "'#{word.id}' is a valid word and its root form is '#{word.root}'."
    end
  end
end
