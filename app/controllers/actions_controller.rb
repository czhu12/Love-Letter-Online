class ActionsController < ApplicationController
  before_action :set_game

  def create
    @action = @game.actions.new(action_params)
    if @action.save
      render json: @action, status: :created
    else
      render json: @action.errors, status: :unprocessable_entity
    end

  end

  def index
  end

  private
    def set_game
      @game = Game.find(params[:id])
    end

    def action_params
      params.require(:action).permit(:parameters)
    end

end
