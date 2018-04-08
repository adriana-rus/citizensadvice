Given(/^the user is searching for ([^"]*) on Google$/) do |website|
  visit(GooglePage).search_for_website (website)
end

Then(/^the website should be found$/) do
  @browser.text.include?('Citizens Advice' && 'https://www.citizensadvice.org.uk/').should == true
end

When(/^the user navigates to Citizens Advice website$/) do
  @browser.link(:xpath, '//a[contains(text(),"Citizens Advice")]').click
end

Then(/^a list of items on the main navigation header should be displayed on the home page$/) do
  on(HomePage).england
  on(HomePage).assert_header_elements
end

Given(/^the user is landed on Citizens Advice website$/) do
  @browser.goto 'https://www.citizensadvice.org.uk/' unless @browser.text.include? 'Welcome to Citizens Advice'
end

When(/^the user searches for ([^"]*) related help$/) do |search_item|
 on(HomePage).search_for_advice (search_item)
end

Then(/^the search results should contain a link to ([^"]*)$/) do |advice_result|
  on(SearchResultsPage).assert_advice_results (advice_result)
end