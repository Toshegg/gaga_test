class Api::Rest::GamesController < ApplicationController
  before_action :set_game, only: [:show, :update, :destroy]

  def index
    @games = Api::Rest::Game.all

    respond_with @games
  end

  def show
    respond_with @game
  end

  def create
    @game = Api::Rest::Game.create(game_params)

    respond_with @game
  end

  def update
    @game.update(game_params)

    respond_with @game
  end

  def destroy
    @game.destroy

    head :no_content
  end

  private
    def set_game
      @game = Api::Rest::Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:name, :players_number)
    end
end
