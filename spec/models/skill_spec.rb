require 'spec_helper'

describe Skill do
  describe "failure" do
     it "should not have duplicate skills" do
       
       sk = Skill.create(:title => "Baseball") 
       sk.should be_valid
       sk2 = Skill.create(:title => "Baseball" )
       sk2.should_not be_valid
       sk2.errors[:title].should =~ ["must be unique"] 
     end    
     
     it "should not have a blank title field" do
        sk = Skill.create(:title => "") 
        sk.should_not be_valid
     end  
  end
  describe "Success " do  
     before :each do
       @attr = {:first_name => "Kartik", :last_name => "Markandan", :email => "kmarkandan@shaw.ca"}
       
     end
     it "should increase the count of the number of skills" do
        lambda {Skill.create(:title => "Baseball")}.should change(Skill, :count).by(1) 
     end
     it "should respond to people" do
        s = Skill.create(:title => "Baseball") 
        s.should respond_to(:people)
     end 
     it "should respond to skill_assocs" do
         s = Skill.create(:title => "Baseball") 
         s.should respond_to(:skill_assocs)
      end  
      it "should be possible to add a person to Skill" do     
        person = Person.create(@attr)
        skill = Skill.create(:title => "Baseball")
        lambda{skill.people << person}.should change(SkillAssoc, :count).by(1)  
        person.skills.should == [skill]
      end
      it "should not increase the count of the number of people if the person exists" do
          person = Person.create(@attr)
          skill = Skill.create(:title => "Baseball") 
          puts skill.people
         
          skill.people << person  
          skill.should be_valid
          skill.people << person
          skill.should_not be_valid
         # lambda{skill.people << person}.should change(SkillAssoc, :count).by(1)
          # skill.people.reload  
         # lambda{skill.people << person}.should change(SkillAssoc, :count).by(0) 
          
          
      end
  end
end
