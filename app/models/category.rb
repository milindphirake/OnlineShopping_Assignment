class Category < ActiveRecord::Base
	has_many :products ,:dependent => :destroy
	validates_presence_of :category_name
	validates_uniqueness_of :category_name
end
