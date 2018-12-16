# frozen_string_literal: true

feature 'User sees how the cards were dealt' do
  scenario 'Two players were entered and they see their hands' do
    visit '/'
    fill_in :num_players, with: '3'
    fill_in :num_cards, with: '2'
    srand(100)
    click_button 'Submit'
    expect(page).to have_content("Outcome\n(The card values are 11 = Jack, "\
                                 '12 = Queen, 13 = King) Player number 1 :'\
                                  ' 13 of Hearts || 12 of Clubs || Player'\
                                  ' number 2 : 10 of Clubs || 12 of Spades ||'\
                                  ' Player number 3 : 10 of Spades || 13 of'\
                                  ' Diamonds ||')
    expect(page).not_to have_content('Player number 100')
  end

  scenario 'User sees who won in the case of a single winner' do
    visit '/'
    fill_in :num_players, with: '3'
    fill_in :num_cards, with: '2'
    srand(100)
    click_button 'Submit'
    expect(page).to have_content('And the winner is: Player number 1')
  end
end
