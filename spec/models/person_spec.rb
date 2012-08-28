require 'spec_helper'

describe Person do 
      before :each do
        @attr = {:first_name => "Kartik", :last_name => "Markandan", :email => "kmarkandan@shaw.ca"}
      end
  describe "Failure" do 
    describe "Email Failures" do
      it "should not have a blank email" do
        @attr = @attr.merge(:email => "")
        p = Person.create(@attr)
        p.should_not be_valid  
      end
      it "should not have email with no @ sign" do
        @attr = @attr.merge(:email => "poli")
        p = Person.create(@attr)
        p.should_not be_valid  
      end
      it "should not have email with no text in front of @ sign" do
        @attr = @attr.merge(:email => "@poli")
        p = Person.create(@attr)
        p.should_not be_valid  
      end
      it "should not have email with no text in front of @ sign" do
        @attr = @attr.merge(:email => "@poli")
        p = Person.create(@attr)
        p.should_not be_valid  
      end
      it "should not have an email without @ sign" do 
        @attr = @attr.merge(:email => "kk.ca")
         p = Person.create(@attr)
          p.should_not be_valid 
      end 
       it "should not have an email without text in front of @ sign" do 
          @attr = @attr.merge(:email => "@kk.ca")
           p = Person.create(@attr)
            p.should_not be_valid
        end 
         it "should not have an email without . sign" do 
           @attr = @attr.merge(:email => "kk@ca")
             p = Person.create(@attr)
              p.should_not be_valid
          end
     end
     
    describe "first name failures" do
      it "should not have a blank first name" do
            @attr = @attr.merge(:first_name => "")
           p = Person.create(@attr)
            p.should_not be_valid
      end
    end
    describe "last name failures" do 
      it "should not have a blank last name" do
          @attr = @attr.merge(:last_name => "")
          p = Person.create(@attr)
          p.should_not be_valid
      end
    end
  end
  describe "Success" do
     it "should pass a valid attribute list" do
       p = Person.create(@attr)
       p.should be_valid
     end
  end
  
 
end
