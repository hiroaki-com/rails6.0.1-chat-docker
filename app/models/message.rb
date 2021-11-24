class Message < ApplicationRecord
  # **********以下を追加**********
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 500 }
  # **********以上を追加**********
end
