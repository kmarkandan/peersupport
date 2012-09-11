Feature: Peersupport Person
  In order to create a peer support worker
  As a administrator
  I want to type in a person's name and email 

Background:
Given that the administrator is logged in 
Then he or she should be able to see the Dashboard

Scenario Outline: Create a successful person
  Given that the "<email>" does not exist
  When I fill in the "<first_name>", "<last_name>", "<email>"    
  Then the list of new people is greater by 1
	And the page should display the "<first_name>", "<last_name>", "<email>"
	Examples:
	|first_name| last_name| email|
	|Kartik| Markandan| kmarkandan@shaw.ca|
  

Scenario Outline: Create a duplicate person
Given that the "<email>" of the person is in the database
When I fill in the "<first_name>", "<last_name>", "<email>"    
Then the list of new people is still the the same
And the page should display an "<error_message>"
	Examples:
	|first_name| last_name| email | error_message| 
	|Kartik| Markandan| kmarkandan@shaw.ca| Email has already been taken|
 

 Scenario Outline: Create a person with invalid person information
 Given that the "<email>" does not exist
 When I fill in the "<first_name>", "<last_name>", "<email>"    
 Then the list of new people is still the the same
 And the page should display an "<error_message>"
Examples:
|first_name| last_name | email | error_message|
|K|  | 2sha.ca| Email is invalid Last name cannot be blank|
|Kart| Engel| @job.ca| Email is invalid|
||Louis | makr@shw.ca| First name cannot be blank|
|Kartik| Markandan||Email can't be blank|  


		 

  
