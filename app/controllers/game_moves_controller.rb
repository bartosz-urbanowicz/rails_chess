class GameMovesController < ApplicationController
  before_action :authenticate_user!

  def create
    @game = Game.find(params[:game_id])
    @move = @game.game_moves.build(move_params)
    @move.save
    GameChannel.broadcast_to(@game, "new move")
    @position = ChessLogic::Position.newFromFen(@game.position)
    @position.make_move(start_field: move_params[:start_field].to_i, end_field: move_params[:end_field].to_i)
    @game.update(position: @position.saveToFen)
    redirect_to play_game_path(@game)
  end

  private

  def move_params
    params.require(:move).permit(:start_field, :end_field)
  end
end
