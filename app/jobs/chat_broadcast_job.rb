class ChatBroadcastJob < ApplicationJob
  queue_as :default

  def perform receiver_id, messages
    ActionCable.server.broadcast "chat:#{receiver_id}", layout: render_message(messages), chat_id: messages.first.chat_id
  end

  private

  def render_message messages
    ApplicationController.renderer.render(partial: "messages/messages", locals: {messages: messages})
  end
end
