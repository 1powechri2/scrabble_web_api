require 'rails_helper'

describe Play do
  context "Instance methods" do
    context "#score_word" do
      it "scores the word" do
        play = create(:play, word: "assess")
        expect(play.score).to eq(6)
      end
    end
    context "#score_word" do
      it "scores the word" do
        play = create(:play, word: "qi")
        expect(play.score).to eq(11)
      end
    end
  end
end
