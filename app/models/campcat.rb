class Campcat < ActiveRecord::Base
  belongs_to :category
  belongs_to :campaign
end
