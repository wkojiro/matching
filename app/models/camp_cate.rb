class CampCate < ActiveRecord::Base
  belongs_to :category
  belongs_to :campaign
end
