class LoginPage
  attr_accessor :loginTab,:txtUsername,:txtPassword,:btnLogin
 
  def initialize(browser)
    @browser = browser
	@browser ||= Watir::Browser.new :chrome
    @accountlogin    = @browser.element(:xpath,"//a[contains(@href,'/login')]")
	@loginoption    = @browser.element(:xpath,"//a[contains(@class,'authentication-modal__alternate-action')]")
    @Username = @browser.element(:xpath,"//input[contains(@name,'email')]")
    @Password = @browser.element(:xpath,"//input[contains(@name,'password')]")
    @Loginsubmit= @browser.element(:xpath,"//div[contains(@class,'authentication-modal__submit')]")
	@Orders= @browser.element(:xpath,"//a[contains(@href,'/orders')]")
	@signout=@browser.element(:xpath,"//a[contains(@href,'/logout')]")
  end
 
  def visit 
    @browser.goto "https://stg.nordstromrack.com"
  end
 
  def clickLoginTab()
    @accountlogin.click
  end
 
  def clickLoginoption()
   @loginoption.click
  end
  
  def enterUsername(username)
    @Username.send_keys(username)
  end
 
  def enterPassword(password)
    @Password.send_keys(password)
  end
 
  def clickLoginButton
    @Loginsubmit.click
  end
 
  def verifyHomePageHeader()
    Watir::Wait.until{@browser.element(:xpath,"//a[contains(@href,'/orders')]").exists?}
	sleep(3)
  end
  
  def signout
	@Orders.hover
	@signout.click
	sleep(3)
  end 
end