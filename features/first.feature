Feature: Add products to cart
 
  Scenario: Add 2 Merck, 2 Milli / 2 PoR, 2 'normal' product to cart
	Given I have navigated to the US channel
    When I navigate to Quick Purchase
	And I enter to Quick Purchase field 1 SKU EMD_BIO-DR1035-50UG
	And I enter to Quick Purchase field 2 SKU MM_NF-4500-0450
	And I enter to Quick Purchase field 3 SKU EMD_BIO-PC176-100UL
	And I enter to Quick Purchase field 4 SKU MM_NF-SLGSV255F
	And I navigate to Shopping Cart page
    Then I see a subtotal of USD 1,159.00