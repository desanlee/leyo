class Noterelationship < ActiveRecord::Base
  attr_accessible :micropost_id, :notetrack_id
  
  belongs_to :notetrack, class_name: "Notetrack"
  belongs_to :micropost, class_name: "Micropost"
  
  validates :notetrack_id, presence: true
  validates :micropost_id, presence: true
  
end
