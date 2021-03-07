@reduce-arguments
Feature: Fat Method
  Catch an fat method call

  Background:
    Given I have the following config
      """
      <?xml version="1.0"?>
      <psalm errorLevel="1">
        <projectFiles>
          <directory name="."/>
          <ignoreFiles> <directory name="../../vendor"/> </ignoreFiles>
        </projectFiles>
        <plugins>
          <pluginClass class="Kafkiansky\ReduceArguments\Plugin"/>
        </plugins>
      </psalm>
      """
  Scenario: Assert that the plugin catch an fat method call
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
            $fatMethodObject = new \Kafkiansky\ReduceArguments\Tests\stubs\FatMethod();

            $fatMethodObject->do(
              "argument1",
              "argument2",
              1,
              true,
              "argument5",
              [],
              2,
              false,
              function(): string { return "argument9"; }
            );
         }
      }
      """
    When I run Psalm
    Then I see these errors
      | Type            | Message                                                                                      |
      | ReduceArguments | You have exceeded the normal number of arguments: the limit is 5, but you have 9. Reduce it. |