class Notetrack < ActiveRecord::Base
  attr_accessible :note_id, :positionindex, :startpoint, :terminal
  has_many :noterelationships, foreign_key: "notetrack_id", class_name:  "Noterelationship", dependent: :destroy
  has_many :microposts, through: :noterelationships, source: :micropost
  belongs_to :travelnote 
end
