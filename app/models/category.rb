class Category < ActiveRecord::Base
    has_many :camp_cates
    has_many :campaigns, :through => :camp_cates

end
