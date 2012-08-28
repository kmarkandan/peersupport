class Person < ActiveRecord::Base  
  # attr_accessible :image
  mount_uploader :image, ImageUploader  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  
  validates :email,  :presence => true,
                     :format => {:with => email_regex},
                     :uniqueness => {:case_sensitive => false}
                     validates_presence_of :first_name, :message => "cannot be blank" 
                     validates_presence_of :last_name, :message => "cannot be blank"
end
