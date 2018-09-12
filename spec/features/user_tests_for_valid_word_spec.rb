require "rails_helper"

describe 'A user visits root to validate word' do
  it 'sees that a word is valid' do
    visit root_path

    fill_in :search, with: "foxes"

    click_on "validate Word"

    expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
  end
  it 'sees that a word is invalid' do
    visit root_path

    fill_in :search, with: "foxez"

    click_on "validate Word"

    expect(page).to have_content("'foxez' is not a valid word.")
  end
end
