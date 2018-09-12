require 'rails_helper'

describe Word do
  it 'can be created with attributes' do
    attributes = {:metadata=>{:provider=>"Oxford University Press"},
                   :results=>
                    [{:id=>"foxes",
                      :language=>"en",
                      :lexicalEntries=>
                       [{:grammaticalFeatures=>
                          [{:text=>"Third", :type=>"Person"}, {:text=>"Singular", :type=>"Number"}, {:text=>"Present", :type=>"Tense"}],
                         :inflectionOf=>[{:id=>"fox", :text=>"fox"}],
                         :language=>"en",
                         :lexicalCategory=>"Verb",
                         :text=>"foxes"},
                        {:grammaticalFeatures=>[{:text=>"Plural", :type=>"Number"}],
                         :inflectionOf=>[{:id=>"fox", :text=>"fox"}],
                         :language=>"en",
                         :lexicalCategory=>"Noun",
                         :text=>"foxes"}],
                      :word=>"foxes"}]}
    word = Word.new(attributes)

    expect(word.id).to eq(attributes[:results].first[:id])
    expect(word.root).to eq(attributes[:results].first[:lexicalEntries][1][:inflectionOf].first[:id])
  end
end
