class ChatroomsController < ApplicationController

  before_action :authenticate_user!

  def create
    current_user_chat_rooms = ChatroomUser.where(user_id: current_user.id).map(&:chatroom)
    chat_room = ChatroomUser.where(chatroom: current_user_chat_rooms, user_id: params[:user_id]).map(&:chatroom).first
    if chat_room.blank?
      chat_room = Chatroom.create
      ChatroomUser.create(chatroom: chat_room, user_id: current_user.id)
      ChatroomUser.create(chatroom: chat_room, user_id: params[:user_id])
    end
    redirect_to action: :show, id: chat_room.id
  end

  def show
    @chat_room = Chatroom.find(params[:id])
    @chat_room_user = @chat_room.users.where.not(id: current_user.id).first
    @chat_messages = ChatMessage.where(chatroom: @chat_room)
  end
end
