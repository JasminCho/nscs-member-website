#The user story we had was:
# As an officer, on the admin page, I would like also to upload documents and let me choose
#names and dates for the documents, so they can be seen in resources.
#Story Board:
#◦ After login, option to manage documents appear. User clicks and gets redirected.
#◦ User gets option to upload new document or modify previous documents.
#◦ User searches for old document from a text box by name or clicking scroll menu by topic-
#keyword. User can change name, add a topic keyword or delete it entirely.

Feature: An admin can upload documents 
  
  As an admin
  I want to be able to upload documents

Background: Start from the admin page
  
  Given I am logged in as an admin
  Then I should see the "manage documents" button

Scenario: Redirection to page that prompts user to upload a new document or modify an existing one
  
  When I click the "manage documents" button
  Then the documents options page appears
  And I see the "upload new documents" button
  And I see the existing documents
  
Scenario: User searches documents 
  
  When I click the scroll menu
  Then I see keywords I can search the documents by
  When I click one of the keywords
  Then I see the documents with that keyword only
  When I type something into the text box
  Then I see the documents that have a name that contain that text I entered
  
Scenario: User edits the document they found
  
  When I select a document
  Then I can see the "change name" button
  And I can see the "add keyword" button
  And I can see "delete" button
  When I click the "change name" button
  Then I can change the name of the document
  When I click the "add keyword" button
  Then I can add a keyword to the document
  When I click the "delete" button
  Then I see a "confirm" button
  When I click the "confirm" button
  Then I have deleted the document 

#◦ If user selects new document, pop-up appears to upload new document and assign a
#name, and a topic keyword. Topic keywords get stored.
#◦ After finishing modifying, user returns to documents menu to upload or change
#another document.