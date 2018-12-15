require './app'

feature 'A winner is chosen' do
  scenario 'The cards are dealt' do
    visit '/'
    fill_in :num_players, with: '2'
    fill_in :num_cards, with: '3'
    click_button 'Submit'
    expect(page).to have_content('And the winner is:')
  end
end
