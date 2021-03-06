Feature: Configurable resource CRUD
  As a client software developer
  I need to be able to configure api resources through Yaml

  @createSchema
  Scenario: Retrieve the ConfigDummy resource
    Given there is a FileConfigDummy object
    When I send a "GET" request to "/fileconfigdummies"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON should be equal to:
    """
    {
      "@context": "/contexts/fileconfigdummy",
      "@id": "/fileconfigdummies",
      "@type": "hydra:Collection",
      "hydra:member": [
          {
              "@id": "/fileconfigdummies/1",
              "@type": "fileconfigdummy",
              "name": "ConfigDummy"
          }
      ],
      "hydra:totalItems": 1
    }
    """

  @dropSchema
  Scenario: Retrieve the ConfigDummy resource
    When I send a "GET" request to "/fileconfigdummies/1"
    Then the response status code should be 200
    And the response should be in JSON
    And the header "Content-Type" should be equal to "application/ld+json"
    And the JSON should be equal to:
    """
    {
          "@context": "\/contexts\/fileconfigdummy",
          "@id": "\/fileconfigdummies\/1",
          "@type": "fileconfigdummy",
          "name": "ConfigDummy"
      }
    """
