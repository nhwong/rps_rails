class GameController < ApplicationController
  def rps
    @user_move = params[:the_move]

    rock = "rock"
    paper = "paper"
    scissors = "scissors"
    valid_move_names = [rock, paper, scissors]

    @computer_move = valid_move_names[rand(3)]
    if @user_move == @computer_move
      @result = "Tie"
    else
      case @user_move
      when rock
        case @computer_move
        when paper
          @result = "Lose"
        when scissors
          @result = "Win"
        else
          abort("Unknown computer move found. Ending program")
        end
      when paper
        case @computer_move
        when scissors
          @result = "Lose"
        when rock
          @result = "Win"
        else
          abort("Unknown computer move found. Ending program")
        end
      when scissors
        case @computer_move
        when rock
          @result = "Lose"
        when paper
          @result = "Win"
        else
          abort("Unknown computer move found. Ending program")
        end
      end
    end

    render("rps.html.erb")
  end
end
