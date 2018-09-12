require 'rails_helper'

describe 'JSON api output for specific game' do
  context "/api/v1/games/1" do
    it 'is a json object' do
      get '/api/v1/games/1'
    end
  end
end
