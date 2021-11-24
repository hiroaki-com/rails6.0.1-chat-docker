class MessagesController < ApplicationController
  def create
    @message = current_user.messages.create!(message_params)
    @message = current_user.messages.create!(message_params)
    # ********** 以下を追加 **********
    # 投稿されたメッセージをチャット参加者に配信
    ActionCable.server.broadcast 'room_channel', message: @message.template
    # ********** 以上を追加 **********
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end