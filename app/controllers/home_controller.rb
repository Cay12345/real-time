class HomeController < ApplicationController
  def index
    @users = User.all
    @chat = Chat.new
  end
end
