  feature "RockPaperScissors" do
    scenario "shows available options" do
      sign_and_play
      expect(page).to have_content "Rock Paper" 
    end

    scenario "player can win with scissors" do
      sign_and_play
      select "Scissors", from: "movee"
      srand(344)
      click_button "Submit my choice"
      expect(page).to have_content "You actually won" 
    end

    scenario "player can draw" do
      sign_and_play
      select "Paper", from: "movee"
      srand(344)
      click_button "Submit my choice"
      expect(page).to have_content "It is a draw" 
    end

    scenario "player can lose" do
      sign_and_play
      select "Rock", from: "movee"
      srand(344)
      click_button "Submit my choice"
      expect(page).to have_content "You lost" 
    end

    scenario "player can play again" do
      sign_and_play
      select "Rock", from: "movee"
      click_button "Submit my choice"
      click_button "Yes"
      expect(page).to have_content "Hi Bob" 
    end
  end