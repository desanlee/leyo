class Travelnote < ActiveRecord::Base
  attr_accessible :content, :locale, :notename, :owner
  has_many :notetracks, foreign_key: "note_id", dependent: :destroy, order: 'positionindex ASC'
  
  default_scope order: 'travelnotes.created_at DESC'
end
