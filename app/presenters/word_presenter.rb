class WordPresenter
  def initialize(word)
    @word = word
  end

  def validation_message
    conn = Faraday.new(:url => 'https://od-api.oxforddictionaries.com/api/v1/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
    response = conn.get do |req|
      req.url "inflections/en/#{@word}"
      req.headers['app_id'] = ENV['DICT_KEY']
      req.headers['app_key'] = ENV['APP_KEY']
    end

    word_json = JSON.parse(response.body, symbolize_names: true)

    word = Word.new(word_json)
    binding.pry
  end
end
