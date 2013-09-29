class Micropicture < ActiveRecord::Base
	has_attached_file :photo
	attr_accessible :micropost_id, :photo
  
end
