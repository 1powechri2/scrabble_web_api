require 'rails_helper'

describe Word do
  it 'can be created with attributes' do
    attributes = {
                  id: "words",
                  inflection_of: "word"
                 }
    word = Word.new(attributes)

    expect(word.id).to eq(attributes[:id])
    expect(word.root).to eq(attributes[:inflection_of])
  end
end
