require 'watir-webdriver'
require 'cucumber'

Given(/^a user goes to Live.com$/) do
  @browser = Watir::Browser.new :chrome
  @browser.goto("live.com")
end


When(/^they enter email and password$/) do
  @browser.text_field(:id => "i0116").set("wpdh_0011174166F@outlook.com")
  @browser.text_field(:id => "i0118").set("Passw0rd!")
  @browser.send_keys :return
  if @browser.div(:id, "idTd_Tile_Error").present?
    @browser.goto("https://signup.live.com/signup.aspx?wa=wsignin1.0&rpsnv=12&ct=1397092782&rver=6.4.6456.0&wp=MBI&wreply=http%3a%2f%2fmail.live.com%2fdefault.aspx&id=64855&cbcxt=mai&snsc=1&bk=1397092785&uiflavor=web&uaid=&mkt=EN-US&lc=1033&lic=1")
    @browser.text_field(:id, "iFirstName").set("wpdh")
    @browser.text_field(:id, "iLastName").set("0011174166F")
    @browser.text_field(:id, "imembernamelive").set("wpdh_0011174166F")
    @browser.text_field(:id, "iPwd").set("Passw0rd!")
    @browser.text_field(:id, "iRetypePwd").set("Passw0rd!")
    @browser.text_field(:id, "iZipCode").set("98052")
    @browser.select_list(:id, "iBirthMonth").select("January")
    @browser.select_list(:id, "iBirthDay").select("1")
    @browser.select_list(:id, "iBirthYear").select("1980")
    @browser.select_list(:id, "iGender").option(:value, "u").select
    @browser.text_field(:id, "iAltEmail").set("wp_user@yahoo.com")

    @browser.checkbox(:id, "iOptinEmail").set(false)
  end

  if @browser.button(:name, "action").present?
    @browser.button(:name, "action").click
  end

  @browser.span(:id, "c_meun").wait_until_present(60)

  @browser.link(:id, "c_clogoc").click
  @browser.link(:id, "c_h_ppl").wait_until_present
  @browser.link(:id, "c_h_ppl").click

  #@browser.link(:class, "c_nobdr t_prs").wait_until_present
 # @browser.link(:class, "c_nobdr t_prs").click

  @browser.text_field(:id, "edtInp_firstName").wait_until_present
  @browser.text_field(:id, "edtInp_firstName").set("wp8buddy1")
  @browser.text_field(:id, "edtInp_personalEmail").set("wp8buddy1@live.com")
  @browser.button(:id, "btnSave").click

  @browser.link(:class, "c_nobdr t_prs").click
  @browser.text_field(:id, "edtInp_firstName").set("wp8buddy2")
  @browser.text_field(:id, "edtInp_personalEmail").set("wp8buddy2@live.com")
  @browser.button(:id, "btnSave").click




end

Then(/^inbox page shows up$/) do
  assert @browser.span(:id, "c_meun").exist?
  @browser.span(:id, "c_meun").click
  # @browser.li(:class, "c_m_lastchild").click
end