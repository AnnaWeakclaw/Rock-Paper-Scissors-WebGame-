def sign_and_play
  visit '/play-one'
  fill_in :player, with: "Bob"
  click_button "Play!"
end
