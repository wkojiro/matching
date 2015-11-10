class Rescat < ActiveRecord::Base
  belongs_to :category
  belongs_to :resume    
end
