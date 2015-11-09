class Campaign < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true
  validates :title, presence: true, length:{maximum: 50 }
  validates :summary, presence: true, length: { maximum: 300 }
  validates :content, presence: true, length: { maximum: 800 }
  validates :startdate, presence: true
  validates :enddate, presence: true  
  mount_uploader :limage, ImageUploader 
  mount_uploader :image1, ImageUploader 
  mount_uploader :image2, ImageUploader 
  mount_uploader :image3, ImageUploader 
  mount_uploader :image4, ImageUploader   
 
  geocoded_by :officeaddress
  after_validation :geocode

def officeaddress
  [office_address01, office_address02, office_address03, office_address04].compact.join(', ')
end

def self.ransackable_attributes auth_object = nil
    %w(office_address01 office_address02 office_address03 office_address04 categories koyokeitai job_description jobtitle01 jobtitle02 jobtitle03)
end



  
  has_many :campcats
  has_many :categories, :through => :campcats
  has_many :applies 
  has_many :users, :through => :applies

end
