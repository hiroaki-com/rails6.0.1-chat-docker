class RoomsController < ApplicationController
  def show
    # 投稿一覧表示に利用
    @messages = Message.includes(:user).order(:id)
    # メッセージ投稿に利用
    @message = current_user.messages.build
  end

  # ********** 以下を追加 **********
  def show_additionally
    # 追加のメッセージ50件を取得する
    last_id = params[:oldest_message_id].to_i - 1    
    @messages = Message.includes(:user).order(:id).where(id: 1..last_id).last(50)
  end
  # ********** 以上を追加 **********
end