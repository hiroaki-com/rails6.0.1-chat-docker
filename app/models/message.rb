class Message < ApplicationRecord
  # **********以下を追加**********
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
  # **********以上を追加**********
  # ********** 以下を追加 **********
  # 投稿されたメッセージをメッセージ用の部分テンプレートでHTMLに変換
  def template
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: self }
  end
  # ********** 以上を追加 **********
end
