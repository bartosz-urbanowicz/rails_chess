class GamesController < ApplicationController
    def index
        @games = Game.all
    end

    def show
        @game = Game.find(params[:id])
    end

    def new
        @game = Game.new
    end

    def create
        @game = Game.new(game_params)

        if @game.save
            redirect_to @game
        else
            render :new, status: :unprocessable_entity
        end
    end

    def play
        @game = Game.find(params[:id])
        @position = ChessLogic::Position.newFromFen(@game.position)
    end
    
    def possible_moves
      @game = Game.find(params[:id])
      @position = ChessLogic::Position.newFromFen(@game.position)
      @possible_moves = @position.board[45].generateMoves
    end

    private
    def game_params
        params.require(:game).permit(:rated, :time_base, :time_increment)
    end
end