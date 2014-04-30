Feature: Sanity check

  @wip
  Scenario: Search for "antibodies"
	Given I navigate to the US channel Home Page
    When I search for "antibodies"
    Then I get 9984 products
	And I get 6118 documents
	And I get 160 pages
 
  Scenario: Add 2 Merck, 2 Milli / 2 PoR, 2 'normal' product to cart
	Given I have navigated to the US channel
    When I navigate to Quick Purchase
	And I enter to Quick Purchase field 1 SKU EMD_BIO-DR1035-50UG
	And I enter to Quick Purchase field 2 SKU MM_NF-4500-0450
	And I enter to Quick Purchase field 3 SKU EMD_BIO-PC176-100UL
	And I enter to Quick Purchase field 4 SKU MM_NF-SLGSV255F
	And I navigate to Shopping Cart page
    Then I see a subtotal of USD 185.43