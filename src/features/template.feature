Feature: Manage Templates
  In order to manage my cloud infrastructure
  As a user
  I want to manage templates

  Background:
    Given I am an authorised user
    And I am logged in
    And There is a mock pulp repository

  Scenario: Create a new Template
    Given I am on the templates page
    When I press "Template"
    Then I should be on the new template page
    When I fill in the following:
      | tpl_name         | mocktemplate  |
      | tpl_platform     | fedora        |
      | tpl_summary      | mockdesc      |
    When I press "Save"
    Then I should be on the templates page
    And I should see "Template saved"
    And I should see "mocktemplate"

  Scenario: Add group and remove package to/from the template
    Given I am on the templates page
    When I press "Template"
    Then I should be on the new template page
    When I fill in the following:
      | tpl_name         | mocktemplate  |
    And I press "Add Software"
    Then I should see "Managed Content Selection"
    When I press "Collections"
    And I check "group_deltacloud"
    And I press "Add Selected"
    Then I should see "Managed Content to Bundle"
    And the "tpl[name]" field by name should contain "mocktemplate"
    And the page should contain "#package_libdeltacloud" selector
    When I press "remove_package_libdeltacloud"
    Then I should see "Managed Content to Bundle"
    And the page should not contain "#package_libdeltacloud" selector
    When I press "Save"
    Then I should be on the templates page
    And I should see "Template saved"
    And I should see "mocktemplate"

  Scenario: Sorting templates
    Given there is a "mock1" template
    And there is a "mock2" template
    And I am on the templates page
    When I follow "Name" within ".templates"
    Then I should see "mock1" followed by "mock2"
    When I follow "Name" within ".templates"
    Then I should see "mock2" followed by "mock1"

  Scenario: Sorting template builds
    Given there is a "mock1" build
    And there is a "mock2" build
    And I am on the template builds page
    When I follow "Name"
    Then I should see "mock1" followed by "mock2"
    When I follow "Name"
    Then I should see "mock2" followed by "mock1"
