require './app'

feature 'User adds quantities of people and cards for each person' do
  scenario 'User enters workable combination' do
    visit '/'
    fill_in :num_players, with: '9'
    fill_in :num_cards, with: '5'
    click_button 'Submit'
    expect(page).to have_content('95')
  end

  scenario 'User enters unworkable combination' do
    visit '/'
    fill_in :num_players, with: '10'
    fill_in :num_cards, with: '7'
    click_button 'Submit'
    expect(page).to have_content("Those numbers don't work, please rethink your quantities")
  end
end
