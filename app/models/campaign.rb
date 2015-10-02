class Campaign < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true
  validates :title, presence: true, length:{maximum: 50 }
  validates :summary, presence: true, length: { maximum: 300 }
  validates :content, presence: true, length: { maximum: 800 }
  mount_uploader :limage, ImageUploader 
  mount_uploader :image1, ImageUploader 
  mount_uploader :image2, ImageUploader 
  mount_uploader :image3, ImageUploader 
  mount_uploader :image4, ImageUploader   
  
  has_many :campcats
  has_many :categories, :through => :campcats

end
