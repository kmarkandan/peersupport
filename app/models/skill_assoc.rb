class SkillAssoc < ActiveRecord::Base  
  belongs_to :skill
  belongs_to :person 
  accepts_nested_attributes_for :skill, :person
  validates_uniqueness_of :skill_id, :scope => :person_id
end
