class Planrelationship < ActiveRecord::Base
  attr_accessible :micropost_id, :traveltrack_id, :positionindex
  
  belongs_to :plan, class_name: "Plan"
  belongs_to :micropost, class_name: "Micropost"
  
  validates :traveltrack_id, presence: true
  validates :micropost_id, presence: true
  validates :positionindex, presence: true
  
  default_scope order: 'planrelationships.positionindex ASC'
  
end
