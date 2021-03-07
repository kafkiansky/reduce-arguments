@reduce-arguments
Feature: Fat Function
  Catch an fat function call

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
  Scenario: Assert that the plugin catch an fat function call
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
            doSomething(
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

      function doSomething(
        string $argument1,
        string $argument2,
        int $argument3,
        bool $argument4,
        string $argument5,
        array $argument6,
        int $argument7,
        bool $argument8,
        callable $argument9
      ): void {
      }
      """
    When I run Psalm
    Then I see these errors
      | Type            | Message                                                                                      |
      | ReduceArguments | You have exceeded the normal number of arguments: the limit is 5, but you have 9. Reduce it. |

  Scenario: Assert that the plugin catch an fat anonymous function call
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
            $func = function (
                      string $argument1,
                      string $argument2,
                      int $argument3,
                      bool $argument4,
                      string $argument5,
                      array $argument6,
                      int $argument7,
                      bool $argument8,
                      callable $argument9
                  ): void {
                  }

            $func(
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