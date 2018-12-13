require './app'

feature 'User sees how the cards were dealt' do
  scenario 'Two players were entered' do
    visit '/'
    fill_in :num_players, with: '9'
    fill_in :num_cards, with: '5'
    click_button 'Submit'
    expect(page).to have_content('Player number 1')
    expect(page).to have_content('Player number 2')
    expect(page).not_to have_content('Player number 100')
  end
end
