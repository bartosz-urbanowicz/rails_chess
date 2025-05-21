class GamesController < ApplicationController
  before_action :authenticate_user!

    def index
      @games = current_user.games
      @games_available_as_white = Game.all.active.available_as_white
      @games_available_as_black = Game.all.active.available_as_black
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
      @field = params[:field]
      @game = Game.find(params[:id])
      @position = ChessLogic::Position.newFromFen(@game.position)
      @white_player = @game.white_player
      @black_player = @game.black_player
      @player_color = current_user == @white_player ? "white" : "black"
      if params[:field]
        @possible_moves = @position
                          .board[params[:field].to_i]
                          .generateMoves(field: params[:field].to_i, board: @position.board)
      end
    end

  private

    def game_params
      params.require(:game).permit(:rated, :time_base, :time_increment)
    end
end