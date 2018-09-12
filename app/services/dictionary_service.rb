class DictionaryService
  def initialize(word)
    @word = word
  end

  def connection
    Faraday.new(:url => 'https://od-api.oxforddictionaries.com/api/v1/') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end
  end

  def response
    response = connection.get do |req|
      req.url "inflections/en/#{@word}"
      req.headers['app_id'] = ENV['DICT_KEY']
      req.headers['app_key'] = ENV['APP_KEY']
    end
  end
end
