class Travelplan < ActiveRecord::Base
  attr_accessible :content, :locale, :owner, :planname
  has_many :traveltracks, foreign_key: "plan_id", dependent: :destroy, order: 'positionindex ASC' 
  
  default_scope order: 'travelplans.created_at DESC'
end
