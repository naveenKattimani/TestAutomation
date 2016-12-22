require "rubygems"
require "watir"
require "rspec"
require "selenium-webdriver"
require "rspec/expectations"
require "test/unit"
require "logger"

Given /^I open nordstromrack website$/ do
    @browser ||= Watir::Browser.new :chrome
    @browser.goto "https://stg.nordstromrack.com"
end
 
When /^I sign in "([^"]*)" and "([^"]*)"$/ do |username,password|
		@browser.element(:xpath,"//a[contains(@href,'/login')]").click
		@browser.element(:xpath,"//a[contains(@class,'authentication-modal__alternate-action')]").click
		@browser.element(:xpath,"//input[contains(@name,'email')]").send_keys(username)
		@browser.element(:xpath,"//input[contains(@name,'password')]").send_keys(password)
		@browser.element(:xpath,"//div[contains(@class,'authentication-modal__submit')]").click
		sleep(3)  	
end
    
Then /^I see homepage$/ do
		Watir::Wait.until{@browser.element(:xpath,"//a[contains(@href,'/orders')]").exists?}
		sleep(3)
end

Then /^I sign out$/ do
		@browser.element(:xpath,"//a[contains(@href,'/orders')]").hover
		@browser.element(:xpath,"//a[contains(@href,'/logout')]").click
		sleep(3)
end