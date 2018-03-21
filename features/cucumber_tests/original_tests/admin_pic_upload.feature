#The user story we had was:
#As an officer, on the admin page, I would like to have the option upload a picture of
#me and a brief description of who I am.
# After login, option to upload or modify picture appears below user picture.
#   Pop-up of menu to upload new file for picture appears.
#   After uploading, picture gets resized by user to make it fit.
#   User accepts and pop up dissapears. New picture in user.

Feature: An admin can upload an image and text on the admin page
  
  As an admin
  I want to be able to upload an image
  And I want to be able to upload text

Background: Start from the admin page
  
  Given I am logged in as an admin
  Then I should see the "upload" button

Scenario: Pop-up shows
  
  When I click the "upload" button
  Then a pop-up will appear
  
Scenario: User is able to resize picture
  
  When I am finished uploading
  Then I can resize the image

Scenario: User confirms, pop-up dissapears and new picture is loaded
  
  When I click "confirm"
  Then the pop-up dissapears
  And the new picture is loaded
