class Listing < ActiveRecord::Base
  #  attr_accessible :tag_list
  belongs_to :user
  #listing
  acts_as_taggable
end
