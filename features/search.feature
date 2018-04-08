Feature: Search

  As a user I want to be able to search for Citizens Advice on Google
  So that I can verify the search functionality on the Citizens Advice website

 Scenario: Search for Citizens Advice on Google
   Given the user is searching for citizens advice on Google
   Then the website should be found
   When the user navigates to Citizens Advice website
   Then a list of items on the main navigation header should be displayed on the home page

  Scenario: Search for Pension related help
   Given the user is landed on Citizens Advice website
   When the user searches for pension related help
   Then the search results should contain a link to State Pension