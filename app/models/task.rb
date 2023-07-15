class Task < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["body", "created_at", "id", "title", "updated_at", "user_id"]
  end
end
