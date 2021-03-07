@reduce-arguments
Feature: Fat Object
  Catch an fat object creation

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
    Scenario: Assert that the plugin catch an fat object creation through new keyword
      Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
            $fatObject = new \Kafkiansky\ReduceArguments\Tests\stubs\FatObject(
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
        | Type            | Message                                                                                        |
        | ReduceArguments | You have exceeded the normal number of arguments: the limit is 5, but you have 9. Reduce it. |
    Scenario: Assert that the plugin catch an fat object creation through named constructor
      Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
            $fatObject = \Kafkiansky\ReduceArguments\Tests\stubs\FatObject::create(
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
        | Type            | Message                                                                                        |
        | ReduceArguments | You have exceeded the normal number of arguments: the limit is 5, but you have 9. Reduce it. |

    Scenario: Assert that the plugin catch an normal object creation through named constructor with a fat object as an argument
      Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
            $normalObject = \Kafkiansky\ReduceArguments\Tests\stubs\ObjectWithAnObjectArgument::new(
              "argument1",
              new \Kafkiansky\ReduceArguments\Tests\stubs\FatObject(
                "argument1",
                "argument2",
                1,
                true,
                "argument5",
                [],
                2,
                false,
                function(): string { return "argument9"; }
              )
            );
         }
      }
      """
    When I run Psalm
    Then I see these errors
      | Type            | Message                                                                                        |
      | ReduceArguments | You have exceeded the normal number of arguments: the limit is 5, but you have 9. Reduce it. |

    Scenario: Assert that the plugin catch an normal object creation through new keyword with a fat object as an argument
      Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
            $normalObject = new \Kafkiansky\ReduceArguments\Tests\stubs\ObjectWithAnObjectArgument(
              "argument1",
              new \Kafkiansky\ReduceArguments\Tests\stubs\FatObject(
                "argument1",
                "argument2",
                1,
                true,
                "argument5",
                [],
                2,
                false,
                function(): string { return "argument9"; }
              )
            );
         }
      }
      """
    When I run Psalm
    Then I see these errors
      | Type            | Message                                                                                        |
      | ReduceArguments | You have exceeded the normal number of arguments: the limit is 5, but you have 9. Reduce it. |