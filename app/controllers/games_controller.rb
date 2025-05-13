class GamesController < ApplicationController
  before_action :authenticate_user!

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
      if params[:start_field] && params[:end_field]
        @position.make_move(start_field: params[:start_field].to_i, end_field: params[:end_field].to_i)
        @game.update(position: @position.saveToFen)
      end
    end
    
    def possible_moves
      @field = params[:field]
      @game = Game.find(params[:id])
      @position = ChessLogic::Position.newFromFen(@game.position)
      @possible_moves = @position.board[params[:field].to_i].generateMoves(field: params[:field].to_i, board: @position.board)
    end

    private
    def game_params
      params.require(:game).permit(:rated, :time_base, :time_increment)
    end
end