class LobbyChannel < ApplicationCable::Channel
  def subscribed
    @game = Game.find_by(code: params[:game_code])
    if @game
      @game.add_player(params[:name])
      stream_from "lobby_channel_#{params[:game_code]}"
      broadcast_user_list
      ActionCable.server.broadcast "lobby_channel_#{params[:game_code]}", { message: "#{params[:name]} has joined the lobby" }
    else
      reject
    end
  end

  def unsubscribed
    @game = Game.find_by(code: params[:game_code])
    if @game
      @game.remove_player(params[:name])
      broadcast_user_list
      ActionCable.server.broadcast "lobby_channel_#{params[:game_code]}", { message: "#{params[:name]} has left the lobby" }
    end
  end
  private

  def broadcast_user_list
    ActionCable.server.broadcast "lobby_channel_#{params[:game_code]}", { users: @game.initial_state['players'] }
  end

end
