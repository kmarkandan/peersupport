Then /^that the administrator has clicked on "(.*?)"$/ do |arg1|
    click_on(arg1)
end

Then /^the administrator is taken to the "(.*?)" page$/ do |arg1|
  page.should have_content(arg1)
end

Then /^the administrator clicks on "(.*?)"$/ do |arg1|
  click_on(arg1)
end

Then /^the administrator creates a  person with the following information "(.*?)", "(.*?)", "(.*?)"$/ do |arg1, arg2, arg3|
  fill_in 'person_first_name',  :with => arg1
  fill_in 'person_last_name',  :with => arg2
  fill_in 'person_email', :with => arg3
end

Then /^successfully loads a picture for the person$/ do
  page.attach_file('person_image', '/Users/kartikmarkandan/SAAS/kartik.jpg')
end

Then /^clicks "(.*?)"$/ do |arg1|
  click_on(arg1)  
    
end

Then /^the administrator should see the  "(.*?)", "(.*?)", "(.*?)", and an image$/ do |arg1, arg2, arg3|
  page.should have_content(arg1)
  page.should have_content(arg2)
  page.should have_content(arg3)
  #pending # express the regexp above with the code you wish you had
end
  
Given /^that a Person with "(.*?)" exists$/ do |arg1|
  page.should have_content(arg1)
end

When /^when the admin clicks "(.*?)"$/ do |arg1|
  click_on(arg1)
end

Then /^the admin should see a form with "(.*?)", "(.*?)" , "(.*?)" and an optional image$/ do |arg1, arg2, arg3|
  page.should have_field('person_first_name', :with => arg1 )
   page.should have_field('person_last_name', :with => arg2 )
    page.should have_field('person_email', :with => arg3 )  
  #pending # express the regexp above with the code you wish you had
end

Then /^the admin should be able to change the "(.*?)", "(.*?)", "(.*?)" and the image$/ do |arg1, arg2, arg3|
   fill_in 'person_first_name',  :with => arg1
  fill_in 'person_last_name',  :with => arg2
  fill_in 'person_email', :with => arg3
end



