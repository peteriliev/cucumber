Given(/^I have navigated to the US channel$/) do
	#visit ui_url 'ViewUserAccount-ShowRegister'
	visit ui_url 'QuickPurchase-Start'
	find(:css, '#maparea_northcentralamerica').click
	find(:xpath, "//a[.='United States']").click
	#click_button('country-selector-accept-cookies')
	find(:css, '#country-selector-accept-cookies').click
end

Given(/^I navigate to the US channel Home Page$/) do
	visit ui_url 'ViewHomepage-DisplayHomepage'
	find(:css, '#maparea_northcentralamerica').click
	find(:xpath, "//a[.='United States']").click
	#click_button('country-selector-accept-cookies')
	find(:css, '#country-selector-accept-cookies').click
end

When(/^I search for "(.*?)"$/) do |term|
	fill_in('SearchTerm', :with => term)
	find(:xpath, "//button[@title=\"Search\"]").click
end

Then(/^I get (\d+) ([^ ]*) as a search result$/) do |count, type|
	page.should have_content type ' (' + number_with_delimiter(count) + ')'
end	

When(/^I navigate to Quick Purchase$/) do
	#visit ui_url 'QuickPurchase-Start'
end

When(/^I enter to Quick Purchase field (\d+) SKU (.*)$/) do |field, sku|
	fill_in('prod_sku_' + field, :with => sku)
	fill_in('prod_qty_' + field, :with => 1)
end

When(/^I navigate to Shopping Cart page$/) do
	click_button('QuickPurchaseAddToCartBtn')
end

Then(/^I see a subtotal of USD (.*)$/) do |estimatedTotal|
	find(:css, '#estimatedBasketTotal1').should have_content(estimatedTotal)
end


When(/^I open the Mega\-Nav "(.*?)" menu$/) do |topmenu|
	#find(:xpath, "//a[text()='"+topmenu+"']").click
	find(:xpath, "//a[text()='" + topmenu + "']").hover
end

When(/^I select "(.*?)" sub\-menu$/) do |sub_menu|
  find(:xpath, "//a[text()='Biopharmaceutical']").hover
end

When(/^I select "(.*?)" sub\-sub\-menu$/) do |sub_sub_menu|
  pending # express the regexp above with the code you wish you had
end

Then(/^I get a CMS page containing text "(.*?)"$/) do |cms_text|
  pending # express the regexp above with the code you wish you had
end

Then(/^I get a CMS page containing left menu "(.*?)"$/) do |left_menu|
  pending # express the regexp above with the code you wish you had
end

Then(/^I get a top left CMS area containing "(.*?)"$/) do |left_cms_area|
  pending # express the regexp above with the code you wish you had
end




When(/^I navigate to the register page$/) do
  visit ui_url 'ViewUserAccount-ShowRegister'
end

When(/^I select Full Registration$/) do
	find(:xpath, "//a[text()='Full Registration']").click
end

When(/^I fill\-in these fields at Register page:$/) do |table|
	table.hashes.map do |hash|  @table = table.raw
		if hash["Field"] == 'MerckFullRegistration_Title'
			select(hash["Value"], :from => 'MerckFullRegistration_Title')
		else
			fill_in(hash["Field"], :with => hash["Value"])  
		end
	end
	check('MerckFullRegistration_TermAndCondition')
	find(:xpath, "//button[@name='login']").click
end

When(/^I fill\-in these fields at Address page:$/) do |table|
	table.hashes.map do |hash|  @table = table.raw
		if hash["Field"] == 'MerckAddressFormWithState_ShippingCountryCode' then
			select(hash["Value"], :from => 'MerckAddressFormWithState_ShippingCountryCode')
			
		elsif hash["Field"] == 'MerckAddressFormWithState_ShippingState' then
			select(hash["Value"], :from => 'MerckAddressFormWithState_ShippingState')
			
		else
			fill_in(hash["Field"], :with => hash["Value"])  
		end
	end
	find(:xpath, "//button[@id='submitAddress']").click
end


Then(/^I get a page reading "(.*?)" and "(.*?)"$/) do |str1, str2|
  page.should have_content str1 and page.should have_content str2 
end