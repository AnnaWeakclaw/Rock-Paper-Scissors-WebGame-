require 'player'

describe Player do
  let(:player) { Player.new("Bob") }
  let(:player_double) { double :player_double, name: "Bob" }

  it "has a name" do
    expect(player.name).to eq("Bob")
  end

  it "makes a choice" do
    expect(player.choice("Rock")).to eq("Rock")
  end

  it "can create self instance" do
    Player.create(player_double)
    expect(Player.instance).to be_instance_of(Player)
  end

  it "can create self instance" do
    Player.create(player_double)
    pl1 = Player.instance
    pl2 = Player.instance
    expect(pl1).to eq(pl2)
  end
end