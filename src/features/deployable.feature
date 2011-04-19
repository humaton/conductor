Feature: Manage Deployables
  In order to manage my cloud infrastructure
  As a user
  I want to manage deployables

  Background:
    Given I am an authorised user
    And I am logged in

  Scenario: List deployables
    Given I am on the homepage
    And there is a deployable named "MySQL cluster"
    When I go to the image factory deployables page
    Then I should see "MySQL cluster"

  Scenario: Create a new Deployable
    Given there is a deployable named "MySQL cluster"
    And I am on the image factory deployables page
    When I follow "Create"
    Then I should be on the new image factory deployable page
    And I should see "New Deployable"
    When I fill in "deployable[name]" with "App"
    And I press "Save"
    Then I should be on App's image factory deployable page
    And I should see "Deployable added"
    And I should have a deployable named "App"
    And I should see "App"

  Scenario: Edit a deployable
    Given there is a deployable named "MySQL cluster"
    And I am on the image factory deployables page
    When I follow "MySQL cluster"
    And I follow "Edit"
    Then I should be on the edit image factory deployable page
    And I should see "Editing Deployable"
    When I fill in "deployable[name]" with "AppModified"
    And I press "Save"
    Then I should be on AppModified's image factory deployable page
    And I should see "Deployable updated"
    And I should have a deployable named "AppModified"
    And I should see "AppModified"

  Scenario: Delete a deployable
    Given there is a deployable named "App"
    And I am on the image factory deployables page
    When I check the "App" deployable
    And I press "Delete"
    Then I should be on the image factory deployables page
    And there should be no deployables

  Scenario: Add an assembly to a deployable
    Given there is a deployable named "Webserver"
    Given there is an assembly named "Apache"
    And I am on the image factory deployables page
    When I follow "Webserver"
    And I follow "details_Assemblies"
    And I follow "Add Assembly..."
    Then I should see "Apache"
    When I check the "Apache" assembly
    And I press "Save"
    Then I should see "Assemblies saved."
    And I should see "Apache"

  Scenario: Remove an assembly from a deployable
    Given there is a deployable named "Webserver"
    Given there is an assembly named "Apache" belonging to "Webserver"
    And I am on the image factory deployables page
    When I follow "Webserver"
    And I follow "details_Assemblies"
    Then I should see "Apache"
    When I check the "Apache" assembly
    And I press "Remove Selected"
    Then I should see "Assemblies removed."
    And I should not see "Apache"
