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
	page.should have_content type + ' (' + number_with_delimiter(count) + ')'
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