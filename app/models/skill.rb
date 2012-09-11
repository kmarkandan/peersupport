class Skill < ActiveRecord::Base
 has_many :skill_assocs
  has_many :people, :through => :skill_assocs  
  accepts_nested_attributes_for :people      
  validates_uniqueness_of :title, :on => :create, :message => "must be unique"   
  validates_presence_of :title, :message => "cannot be blank" 
end
