class Skill < ActiveRecord::Base
 has_many :skill_assocs
  has_many :people, :through => :skill_assocs  
  accepts_nested_attributes_for :people
end
