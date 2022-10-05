class ChatsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_chat, only: :show
  before_action :check_chat_of_user, only: :show

  def create
    chat = Chat.get_by_2_users(params_chats[:receiver_id], current_user.id).first

    chat = Chat.create params_chats.merge(sender_id: current_user.id) if chat.blank?

    redirect_to chat_path(chat)
  end

  def show
    @messages = @chat.messages
    @message = Message.new
  end

  private

  def params_chats
    params.require(:chat).permit :receiver_id
  end

  def get_chat
    @chat = Chat.find_by(id: params[:id])
  end

  def check_chat_of_user
    return if current_user.id == @chat.receiver_id || current_user.id == @chat.sender_id

    redirect_to root_path
  end
end
