class Category < ActiveRecord::Base
    has_many :campcats
    has_many :campaigns, :through => :campcats
    has_many :rescats
    has_many :resumes, :through => :rescats    
end
