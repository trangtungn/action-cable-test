class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_room_#{params[:room_id]}"
  end
end
