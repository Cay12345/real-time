class ChatsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
