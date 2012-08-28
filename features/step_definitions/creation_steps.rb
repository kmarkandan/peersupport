Given /^that the "(.*?)" does not exist$/ do |arg1|
  Person.find_by_email(arg1).should be_nil
  @count = Person.count
end


When /^I fill in the "(.*?)", "(.*?)", "(.*?)"$/ do |arg1, arg2, arg3|
  visit new_person_path      
  fill_in 'person_first_name',  :with => arg1
  fill_in 'person_last_name',  :with => arg2
  fill_in 'person_email', :with => arg3
  click_button("Submit") 
  
  #pending # express the regexp above with the code you wish you had
end
            
Then /^the list of new people is greater by (\d+)$/ do |arg1|
 Person.count.should == @count + arg1.to_i
end      

And /^the page should display the "(.*?)", "(.*?)", "(.*?)"$/ do |arg1, arg2, arg3|
  #page.should have_content("nothing")
  page.should have_content(arg1 + " " + arg2 + " " + arg3)
end
                                                         

Given /^that the "(.*?)" of the person is in the database$/ do |arg1|
  Person.create(:first_name =>"Kartik", :last_name => "Markandan", :email => arg1)
  Person.count(:conditions => "email == '#{arg1}'").should have_at_least(1).things
  @count = Person.count
end 

Then /^the list of new people is still the the same$/ do
 Person.count.should == @count
end


Then /^the page should display an "(.*?)"$/ do |arg1|
  save_and_open_page
  page.should have_content(arg1)
end