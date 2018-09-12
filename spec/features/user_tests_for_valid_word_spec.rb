# Feature:
# As a guest user (no sign in necessary)
# When I visit “/”
# And I fill in a text box with “foxes”
# And I click “Validate Word”
# Then I should see a message that says “‘foxes’ is a valid word and its root form is ‘fox’.”
#
# As a guest user
# When I visit “/”
# And I fill in a text box with “foxez”
# And I click “Validate Word”
# Then I should see a message that says “‘foxez’ is not a valid word.”

require "rails_helper"

describe 'A user visits root to validate word' do
  it 'sees that a word is valid' do
    visit root_path

    fill_in :search, with: "foxes"

    click_on "validate Word"

    expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
  end
end
