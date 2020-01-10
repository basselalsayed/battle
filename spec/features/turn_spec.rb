feature 'change_turn' do 
  scenario 'changes turn after player 1 attack' do
    sign_in_and_play
    click_button "Attack!"
    click_button "Attack!"
    expect(page).to have_content 'david HP: 90'
  end
end
