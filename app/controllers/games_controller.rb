class GamesController < ApplicationController
  PROFILE_PICTURES = Dir[Rails.root.join("public", "images", "love_letter", "characters", "*.webp")].map { |f| File.basename(f) }
  def create
    game = Game.create
    redirect_to play_url(code: game.code, name: params[:name])
  end

  def start
  end

  def show
    @game = Game.find_by_code(params[:code])
    if @game.nil?
      redirect_to root_path, alert: "No game found with code #{params[:code]}"
    end
    @cards = [
      Cards::Baron.new(nil, nil),
      Cards::Princess.new(nil, nil),
    ] # Two Cards
  end
end
