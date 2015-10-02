class Category < ActiveRecord::Base
    has_many :campcats
    has_many :campaigns, :through => :campcats
end
