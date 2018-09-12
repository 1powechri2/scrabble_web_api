class Api::V1::GamesController < ApplicationController
  def show
    render json: Game.find(params[:id])
  end

  def update
    Play.create(user_id: request.headers[:user_id], game_id: params[:id], word:request.headers[:word])
    render json: Game.find(params[:id])
  end
end
