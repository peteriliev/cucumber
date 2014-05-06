Feature: Sanity check

  Scenario: Search for "antibodies"
	Given I navigate to the US channel Home Page
    When I search for "antibodies"
    Then I get 9984 Products as a search result
	And I get 6118 Documents as a search result
	And I get 160 Pages as a search result
 
  Scenario: Add 2 Merck, 2 Milli / 2 PoR, 2 'normal' product to cart
	Given I have navigated to the US channel
    When I navigate to Quick Purchase
	And I enter to Quick Purchase field 1 SKU EMD_BIO-DR1035-50UG
	And I enter to Quick Purchase field 2 SKU MM_NF-4500-0450
	And I enter to Quick Purchase field 3 SKU EMD_BIO-PC176-100UL
	And I enter to Quick Purchase field 4 SKU MM_NF-SLGSV255F
	And I navigate to Shopping Cart page
    Then I see a subtotal of USD 185.43

  Scenario: Verify mega nav
    Given I navigate to the US channel Home Page
	When I open the Mega-Nav "Products" menu
	And I select "Biopharmaceutical Manufacturing" sub-menu
	And I select "Harvest" sub-sub-menu
	Then I get a CMS page containing text "we offer a range of solutions that optimize quality"
	And I get a CMS page containing left menu "Downstream Processing"
	And I get a top left CMS area containing "Interactive Demo"
	
  @wip
  Scenario: Registration
    Given I navigate to the US channel Home Page
	When I navigate to the register page
	And I select Full Registration
	And I fill-in these fields at Register page:
		| Field									| Value						|
		| MerckFullRegistration_Login			| peteriliev7@hotmail.com	|
		| MerckFullRegistration_Password		| pass1234					|
		| MerckFullRegistration_RetypedPassword	| pass1234					|
		| MerckFullRegistration_Title			| Mr.						|
		| MerckFullRegistration_FirstName		| Peter						|
		| MerckFullRegistration_LastName		| Iliev						|
		| MerckFullRegistration_Company			| Acme Motors				|
		| MerckFullRegistration_Telephone		| +359888916361				|	
	And I fill-in these fields at Address page:
		| Field												| Value						|
		| MerckAddressFormWithState_ShippingAddressLineOne	| 20 Main Str				|
		| MerckAddressFormWithState_ShippingAddressLineTwo	| 							|
		| MerckAddressFormWithState_ShippingAddressLineThree| 							|
		| MerckAddressFormWithState_ShippingCity			| Ocean City				|
		| MerckAddressFormWithState_ShippingPostalCode		| 4000						|
		| MerckAddressFormWithState_ShippingCountryCode		| United States				|
		| MerckAddressFormWithState_ShippingState			| New Jersey				|
	Then I get a page reading "Thank You for Registering" and "Activation Code"