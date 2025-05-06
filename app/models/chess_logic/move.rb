module ChessLogic
  class Move
    attr_reader :start_field, :end_field

    def initialize(start_field:, end_field:)
      @start_field = start_field
      @end_field = end_field
    end
  end
end