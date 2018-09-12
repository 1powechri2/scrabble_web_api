require 'rails_helper'

describe 'JSON api output for specific game' do
  context "/api/v1/games/1" do
    it 'is a json object' do
      josh = User.create(id: 1)
      sal  = User.create(id: 2)

      game = Game.create(id: 1, player_1: josh, player_2: sal)

      play1 = josh.plays.create(game: game, word: "qwa", score: 15)
      play2 = sal.plays.create(game: game, word: "qwat", score: 16)

      get '/api/v1/games/1'

      expect(response.status).to eq(200)

      game_api = JSON.parse(response.body, symbolize_names: true)

      expect(game_api[:game_id]).to eq(game.id)
      expect(game_api[:scores][0][:user_id]).to eq(josh.id)
      expect(game_api[:scores][0][:score]).to eq(play1.score)
      expect(game_api[:scores][1][:user_id]).to eq(sal.id)
      expect(game_api[:scores][1][:score]).to eq(play2.score)
    end
  end
  context "post /api/v1/games/1/plays" do
    it 'updates game as a json object' do
      josh = User.create(id: 1)
      sal  = User.create(id: 2)

      game = Game.create(id: 1, player_1: josh, player_2: sal)

      play1 = josh.plays.create(game: game, word: "qwa", score: 15)
      play2 = sal.plays.create(game: game, word: "qwat", score: 16)

      post "/api/v1/games/1/plays", headers: { 'user_id' => 1, 'word' => 'at'}

      game_api = JSON.parse(response.body, symbolize_names: true)

      expect(game_api[:game_id]).to eq(game.id)
      expect(game_api[:scores][0][:user_id]).to eq(josh.id)
      expect(game_api[:scores][0][:score]).to eq(play1.score + 2)
      expect(game_api[:scores][1][:user_id]).to eq(sal.id)
      expect(game_api[:scores][1][:score]).to eq(play2.score)
    end
  end
end
