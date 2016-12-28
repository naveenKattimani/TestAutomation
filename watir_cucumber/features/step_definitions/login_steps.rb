require "rubygems"
require "watir"
require "rspec"
require "selenium-webdriver"
require "rspec/expectations"
require "test/unit"
require "logger"
require "./Functions/ResuableFunctions"

Given /^I open nordstromrack website$/ do
    @LoginPage = LoginPage.new(@browser)
	@LoginPage.visit
end
 
When /^I sign in "([^"]*)" and "([^"]*)"$/ do |username,password|
		@LoginPage.visit
		@LoginPage.clickLoginTab
		@LoginPage.clickLoginoption
		@LoginPage.enterUsername(username)
		@LoginPage.enterPassword(password)
		@LoginPage.clickLoginButton
		sleep(3)  	
end
    
Then /^I see homepage$/ do
		@LoginPage.verifyHomePageHeader
end

Then /^I sign out$/ do
		@LoginPage.signout
		sleep(3)
end