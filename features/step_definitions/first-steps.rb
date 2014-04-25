Given(/^I have navigated to the US channel$/) do
	visit ui_url 'ViewUserAccount-ShowRegister'
	find(:css, '#maparea_northcentralamerica').click
	find(:xpath, "//a[.='United States']").click
	click_button('country-selector-accept-cookies')
end

When(/^I navigate to Quick Purchase$/) do
	visit ui_url 'QuickPurchase-Start'
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