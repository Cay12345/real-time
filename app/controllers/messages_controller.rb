class MessagesController < ApplicationController
  def create
    new_message = current_user.messages.create! params_message

    if new_message.chat.sender_id == current_user.id
      receiver_id = new_message.chat.receiver_id
    else
      receiver_id = new_message.chat.sender_id
    end

    @chat = new_message.chat
    @messages = @chat.messages

    ChatBroadcastJob.perform_now(receiver_id, @messages)

    respond_to do |format|
      format.js
    end
  end

  private

  def params_message
    params.require(:message).permit(:content, :chat_id)
  end
end
