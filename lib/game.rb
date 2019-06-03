class Game
  attr_reader :option, :users_choice
  def initialize(player_name, users_choice, second_human = "Nothing")
    # it this too much happening in initialize?
    @options = ["Rock", "Paper", "Scissors"]
    @users_choice = users_choice
    @second_human = second_human
    @template = [
      { :pair => ["Rock", "Scissors"], :win => "Rock" },
      { :pair => ["Rock", "Paper"], :win => "Paper" },
      { :pair => ["Paper", "Scissors"], :win => "Scissors" }
    ]
    # Ideally this would go into view
    @images = [
      {:item => "Rock", :img => "/images/rock.jpg"},
      {:item => "Paper", :img => "/images/paper.jpg"},
      {:item => "Scissors", :img => "/images/scissors.jpg"}
    ]
    @player1_name = player_name
  end

  def score
    # Line below was the only change for two players instead of computer
    @option = @second_human
    @option = random_item if @second_human == "Nothing"
    @option == @users_choice ? winner = "It is a draw"  : winner = calculate
  end

   def give_image(option)
     image_hash = @images.find { |image|
        image[:item] == option
      }
      image_hash[:img]
    end

  private

  def calculate
    winner = ""
       # select is probably not the best choice here but what is?
    @template.select { |configuration|
      if pair_includes?(configuration, @users_choice) && pair_includes?(configuration, @option)
        configuration[:win] == option ? winner = "#{@player1_name} lost Ha Ha" : winner = "#{@player1_name} actually won!"
      end
      }
      winner 
  end

  def pair_includes?(config, choice_option)
    config[:pair].include?(choice_option)
  end

  def random_item 
    choice = rand(3)
    @options[choice]
  end

end
