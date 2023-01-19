class Public::RoomsController < ApplicationController
  before_action :authenticate_user!
  def create
    room = Room.create
    current_entry = Entry.create(user_id: current_user.id, room_id: room.id)
    another_entry = Entry.create(user_id: params[:entry][:user_id], room_id: room.id)
    redirect_to room_path(room)
  end

  def index
    # ログインユーザー所属ルームID取得
    current_entries = current_user.entries
    my_room_id = []
    current_entries.each do |entry|
      my_room_id << entry.room.id
    end
    # 自分のroom_idでuser_idが自分じゃないのを取得
    @another_entries = Entry.where(room_id: my_room_id).where.not(user_id: current_user.id)
  end

  def show
    @room = Room.find(params[:id]) #一つのroomを表示
    @messages = @room.messages.all #過去のやり取りを全て表示
    @message = Message.new #新しくメッセージを作る
    @entries = @room.entries #ビューで相手の名前を
    @another_entry = @entries.where.not(user_id: current_user.id).first
  end
end
