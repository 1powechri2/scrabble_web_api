require 'rails_helper'

describe 'JSON api output for specific game' do
  context "/api/v1/games/1" do
    it 'is a json object' do
      josh = User.create(id: 1)
      sal  = User.create(id: 2)

      game = Game.create(id: 1, player_1: josh, player_2: sal)

      josh.plays.create(game: game, word: "qwa", score: 15)
      sal.plays.create(game: game, word: "qwat", score: 16)

      get '/api/v1/games/1'

      expect(response.status).to eq(200)
      
              {
          "game_id":1,
          "scores": [
            {
              "user_id":1,
              "score":15
            },
            {
              "user_id":2,
              "score":16
            }
          ]
        }
    end
  end
end
