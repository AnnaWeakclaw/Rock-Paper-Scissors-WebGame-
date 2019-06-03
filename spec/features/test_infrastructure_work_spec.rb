feature "Start" do
  scenario "can choose one player" do
    visit('/')
    click_button "Only One Player"
    expect(page).to have_content "What is your name?" 
  end

  scenario "can choose two players" do
    visit('/')
    click_button "There Is Two Of Us"
    expect(page).to have_content "What is your name? What is your name?" 
  end
end
  
  feature "Player" do
    scenario "can enter name" do
      sign_and_play_one
      expect(page).to have_content "Hi Bob!" 
    end
  end

  feature "Players" do
    scenario "can enter two names" do
      sign_and_play_two
      expect(page).to have_content "Hi Bob and Emma!" 
    end
  end
