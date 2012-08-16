Feature: Peersupport Person
  In order to create a peer support worker
  As a administrator
  I want to type in a person's name and skills

Scenario Outline: Create a person
  Given that the <person> does not exist
  When I create a new <person>
  Then the list of new supporters is greater by 1
	And the page should display the <person>
	Examples:
	|person|
	|"Kartik Markandan"|


 

  
