class Traveltrack < ActiveRecord::Base
  attr_accessible :plan_id, :positionindex, :startpoint, :terminal
  has_many :planrelationships, foreign_key: "traveltrack_id", class_name:  "Planrelationship", dependent: :destroy
  has_many :microposts, through: :planrelationships, source: :micropost, order: 'infotype DESC' 
  belongs_to :travelplan 
end
