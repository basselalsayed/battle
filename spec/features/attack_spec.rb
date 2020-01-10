feature 'attack' do
  scenario 'attack reduces player 2 HP' do 
    sign_in_and_play
    click_button "Attack!"
    expect(page).to have_content 'goliath HP: 90'
  end
end
