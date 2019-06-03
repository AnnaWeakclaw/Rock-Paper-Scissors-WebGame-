  feature "RockPaperScissors for one" do
    scenario "shows available options" do
      sign_and_play_one
      expect(page).to have_content "Rock Paper" 
    end

    scenario "player can win with scissors" do
      sign_and_play_one
      select "Scissors", from: "movee"
      srand(344)
      click_button "Submit my choice"
      expect(page).to have_content "Bob actually won" 
    end

    scenario "player can draw" do
      sign_and_play_one
      select "Paper", from: "movee"
      srand(344)
      click_button "Submit my choice"
      expect(page).to have_content "It is a draw" 
    end

    scenario "player can lose" do
      sign_and_play_one
      select "Rock", from: "movee"
      srand(344)
      click_button "Submit my choice"
      expect(page).to have_content "Bob lost" 
    end

    scenario "player can play again" do
      sign_and_play_one
      select "Rock", from: "movee"
      click_button "Submit my choice"
      click_button "Yes"
      expect(page).to have_content "Hi Bob" 
    end
  end

  feature "RockPaperScissors for two" do
    scenario "shows available options" do
      sign_and_play_two
      expect(page).to have_content "Rock Paper Scissors Rock Paper Scissors" 
    end

    scenario "human player1 can lose against human player2" do
      sign_and_play_two
      select "Rock", from: "move1"
      select "Paper", from: "move2"
      click_button "Submit my choice"
      expect(page).to have_content "Bob lost" 
    end

    scenario "both players can draw" do
      sign_and_play_two
      select "Paper", from: "move1"
      select "Paper", from: "move2"
      click_button "Submit my choice"
      expect(page).to have_content "It is a draw" 
    end

    scenario "player1 can win with player2" do
      sign_and_play_two
      select "Scissors", from: "move1"
      select "Paper", from: "move2"
      click_button "Submit my choice"
      expect(page).to have_content "Bob actually won" 
    end

    scenario "player can play again" do
      sign_and_play_two
      select "Rock", from: "move1"
      select "Rock", from: "move2"
      click_button "Submit my choice"
      click_button "Yes"
      expect(page).to have_content "Hi Bob and Emma" 
    end
  end
