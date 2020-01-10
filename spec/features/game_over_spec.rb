feature 'game ends in result' do 
  scenario 'game ends' do 
    sign_in_and_play
    19.times { click_button('Attack!') }
    expect(page).to have_content 'goliath loses'
  end
end