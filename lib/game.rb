class Game
  attr_reader :option, :users_choice
  def initialize(users_choice)
    @options = ["Rock", "Paper", "Scissors"]
    @users_choice = users_choice
    @template = [
      { :pair => ["Rock", "Scissors"], :win => "Rock" },
      { :pair => ["Rock", "Paper"], :win => "Paper" },
      { :pair => ["Paper", "Scissors"], :win => "Scissors" }
    ]
    @images = [
      {:item => "Rock", :img => "/images/rock.jpg"},
      {:item => "Paper", :img => "/images/paper.jpg"},
      {:item => "Scissors", :img => "/images/scissors.jpg"}
    ]
  end

  def score
    @option = random_item
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
      if configuration[:pair].include?(@users_choice) && configuration[:pair].include?(@option)
        configuration[:win] == option ? winner = "You lost Ha Ha" : winner = "You actually won!"
      end
      }
      winner 
  end

  def random_item 
    choice = rand(3)
    @options[choice]
  end

end
