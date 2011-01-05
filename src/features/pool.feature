Feature: Manage Pools
  In order to manage my cloud infrastructure
  As a user
  I want to manage my pools

  Background:
    Given I am an authorised user
    And I am logged in
    And I am using new UI

  Scenario: Create a new Pool
    Given I am on the pools page
    And there is not a pool named "mockpool"
    When I follow "New Pool"
    Then I should be on the new resources pool page
    And I should see "Create a new Pool"
    When I fill in "pool_name" with "mockpool"
    And I press "Save"
    Then I should be on the resources pool page
    And I should see "Pool added"
    And I should see "mockpool"
    And I should have a pool named "mockpool"

  @tag
  Scenario: View Pool's Quota Usage
    Given I have Pool Creator permissions on a pool named "mockpool"
    And the "mockpool" Pool has a quota with following capacities:
    | resource                  | capacity |
    | maximum_running_instances | 10       |
    | running_instances         | 8        |
    And I am on the resources pools page
    When I follow "mockpool"
    Then I should be on the show pool page
    When I follow "Quota"
    Then I should see the following:
    | mockpool | 10           | 80.0             |

  Scenario: Enter invalid characters into Name field
    Given I am an authorised user
    And I am on the new pool page
    When I fill in "pool[name]" with "@%&*())_@!#!"
    And I press "Save"
    Then I should see "Name must only contain: numbers, letters, spaces, '_' and '-'"
