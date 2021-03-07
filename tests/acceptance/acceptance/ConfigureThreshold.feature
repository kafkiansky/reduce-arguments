@reduce-arguments
Feature: Configure Threshold
  Configure threshold through plugin globals.

  Background:
    Given I have the following config
      """
      <?xml version="1.0"?>
      <psalm errorLevel="1">
        <projectFiles>
          <directory name="."/>
          <ignoreFiles> <directory name="../../vendor"/> </ignoreFiles>
        </projectFiles>
        <globals>
          <var name="argumentsCountThreshold" type="2" />
        </globals>
        <plugins>
          <pluginClass class="Kafkiansky\ReduceArguments\Plugin"/>
        </plugins>
      </psalm>
      """
  Scenario: Assert that the plugin catch an fat function call when limit arguments is 2
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
            doSomething("argument1", "argument2", 1);
         }
      }

      function doSomething(
        string $argument1,
        string $argument2,
        int $argument3
      ): void {
      }
      """
    When I run Psalm
    Then I see these errors
      | Type            | Message                                                                                      |
      | ReduceArguments | You have exceeded the normal number of arguments: the limit is 2, but you have 3. Reduce it. |