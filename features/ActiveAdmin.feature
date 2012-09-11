Feature: Peersupport Person
  In order to edit a peer support worker
  As a administrator
  I want to refill a person's information 

Background:
Given that the administrator is logged in 
Then he or she should be able to see the Dashboard 
And that the administrator has clicked on "Peer Support Workers"
Then the administrator is taken to the "People" page
And the administrator clicks on "New Person"
Then the administrator creates a  person with the following information "Kartik", "Markandan", "kmarkandan@shaw.ca"
And successfully loads a picture for the person
Then clicks "Create Person"
Then the administrator should see the  "Kartik", "Markandan", "kmarkandan@shaw.ca", and an image 
 
@javascript
Scenario Outline: Ability to edit a person's features -- good path
Given that a Person with "<email>" exists
When when the admin clicks "Edit Person"
Then the admin should see a form with "<first_name>", "<last_name>" , "<email>" and an optional image 
And the admin should be able to change the "<first_name_change>", "<last_name_change>", "<email_change>" and the image
Then clicks "Update Person"
 And the page should display the "<first_name_change>", "<last_name_change>", "<email_change>"   

Examples:
|first_name| last_name| email| first_name_change| last_name_change| email_change|
|Kartik| Markandan| kmarkandan@shaw.ca| Kartika| Markandan| kmark@shaw.ca|
|Kartik| Markandan| kmarkandan@shaw.ca| Kartik| Markandana| kmark@shaw.ca| 
|Kartik| Markandan| kmarkandan@shaw.ca| Kartika| Markandan| kmarkanda@shaw.ca|   

 
Scenario Outline: Ability to edit a person's features -- good path
Given that a Person with "<email>" exists
When when the admin clicks "Edit Person"
Then the admin should see a form with "<first_name>", "<last_name>" , "<email>" and an optional image 
And the admin should be able to change the "<first_name_change>", "<last_name_change>", "<email_change>" and the image
Then clicks "Update Person"
And the page should display an "<error_message>"
|K|  | 2sha.ca| Email is invalid Last name cannot be blank|
|Kart| Engel| @job.ca| Email is invalid|
||Louis | makr@shw.ca| First name cannot be blank|
|Kartik| Markandan||Email can't be blank|   
