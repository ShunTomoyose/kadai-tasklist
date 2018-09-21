class Task < ApplicationRecord
  validates :content, presence: true, length: { maximum: 10 } #validationテストのためにcontentも10文字に制限
  validates :status, presence: true, length: { maximum: 10 }
  validates :user_id, presence: true
  
  belongs_to :user
end
