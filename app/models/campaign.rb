class Campaign < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true
  validates :title, presence: true, length:{maximum: 50 }
  validates :summary, presence: true, length: { maximum: 300 }
  validates :content, presence: true, length: { maximum: 800 }
end
