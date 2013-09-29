class Micropost < ActiveRecord::Base
	has_attached_file :photo, 
	styles:  {
		thumb: "150x100#",  
		small: "400x300#",  
		large: "800x600#"
	}
  
  attr_accessible :content, :startpoint, :endpoint, :owner, :parent, :infotype, :infoname, :photo
  
  has_many :reverse_planrelationships, foreign_key: "micropost_id", class_name:  "Planrelationship", dependent: :destroy
  has_many :traveltracks, through: :reverse_planrelationships, source: :traveltracks
  
  has_many :reverse_noterelationships, foreign_key: "micropost_id", class_name:  "Planrelationship", dependent: :destroy
  has_many :notetracks, through: :reverse_noterelationships, source: :notetracks
  
  validates :content, length: { maximum: 140 }
    
  def addin!(current_traveltrack)
    Planrelationship.create!(traveltrack_id: current_traveltrack.id, micropost_id: self.id)
  end
  
  def moveout!(current_traveltrack)
    Planrelationship.find_by_traveltrack_id_and_micropost_id(current_traveltrack.id, self.id).delete
  end
  
end
