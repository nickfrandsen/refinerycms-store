@products
Feature: Products
  In order to have products on my website
  As an member
  I want to view products

  Background:
    Given A Refinery user exists
    And I only have a foo product

  @products-index
  Scenario: Products index
   Given I have products titled Product002
   When I go to the products index
   Then I should see "foo product"
   And I should see "Product002"

  @product-show
  Scenario: Show product
   When I go to the products index
   Then I should see "foo product"
   When I follow "foo product"
   Then I should see "description for product"

