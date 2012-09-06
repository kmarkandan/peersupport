class Person < ActiveRecord::Base  
  # attr_accessible :image 
  has_many :skill_assocs
  has_many :skills, :through => :skill_assocs   
  accepts_nested_attributes_for :skills 
  mount_uploader :image, ImageUploader  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email,  :presence => true,
                     :format => {:with => email_regex},
                     :uniqueness => {:case_sensitive => false}
                     validates_presence_of :first_name, :message => "cannot be blank" 
                     validates_presence_of :last_name, :message => "cannot be blank" 
                     
end
               
#Person.create({"first_name"=>"K", "last_name"=>"M", "email"=>"jlaj@shw.ca", "skill"=>{"title"=>["",
#{}"1", "2"]}})

#{}"skill"=>{"title"=>["","1", "2"]}}                                       



#p = { :person => { :first_name => 'Joe', :last_name => "Lacava", :email => "j@hotmail.com", :skill_attributes=>{"skill_id"=>["", "1"]}  }}
#:person =>{"first_name"=>"ajfkl", "last_name"=>"ajfkl", "email"=>"al;@shaw.ca", "skills_attributes"=>{"object_id"=>[1,2]}}   