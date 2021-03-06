require 'game'

describe Game do

  describe "Game for One" do
  let(:game) { Game.new("Bob", "Scissors") }
  
  # random_item is private and tested as part of score method
  # it "can randomly generate Rock/Paper/Scissors" do
  #   srand(344)
  #   expect(game.random_item).to eq("Paper")
  # end

  it "can determine who is a winner" do
    srand(344)
    # random is Paper and users is Scissors so the user has won
    expect(game.score).to eq("Bob actually won!")
  end

  it "can determine who is a winner" do
    srand(156)
    # random is Rock and users is Scissors so the user has lost
    expect(game.score).to eq("Bob lost Ha Ha")
  end

  it "can recognize a draw" do
    game1 = Game.new("Bob", "Paper")
    srand(344)
    expect(game1.score).to eq("It is a draw")
  end

  it "can give me image back" do
    expect(game.give_image(game.users_choice)).to eq("/images/scissors.jpg")
  end

  it "can give me random image back" do
    srand(344)
    game.score
    expect(game.give_image(game.option)).to eq("/images/paper.jpg")
  end
end

describe "Game for Two" do
  let(:game2) { Game.new("Bob", "Rock", "Rock") }
  it "can have two human inputs" do
    expect(game2.score).to eq("It is a draw")
  end
end
end
