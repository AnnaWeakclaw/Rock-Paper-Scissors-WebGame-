def sign_and_play_one
  visit '/play-one'
  fill_in :player, with: "Bob"
  click_button "Play!"
end

def sign_and_play_two
  visit '/play-two'
  fill_in :player, with: "Bob"
  fill_in :player2, with: "Emma"
  click_button "Play!"
end