@reduce-arguments
Feature: No Errors
  Valid Cases

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
  Scenario: Assert that the plugin no see the errors when we create the object through named constructor and without arguments
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
             $normalObject = \Kafkiansky\ReduceArguments\Tests\stubs\ObjectWithoutConstructorArguments::create();
         }
      }
      """
    When I run Psalm
    Then I see no errors

  Scenario: Assert that the plugin no see the errors when we create the object through new keyword and without arguments
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
             $normalObject = new \Kafkiansky\ReduceArguments\Tests\stubs\ObjectWithoutConstructorArguments();
         }
      }
      """
    When I run Psalm
    Then I see no errors

  Scenario: Assert that the plugin no see the errors when we create the object through new keyword and with normal count of arguments
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
             $normalObject = new \Kafkiansky\ReduceArguments\Tests\stubs\ObjectWithConstructorArguments('Test');
         }
      }
      """
    When I run Psalm
    Then I see no errors

  Scenario: Assert that the plugin no see the errors when we create the object through named constructor and with normal count of arguments
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
             $normalObject = \Kafkiansky\ReduceArguments\Tests\stubs\ObjectWithConstructorArguments::create('Test');
         }
      }
      """
    When I run Psalm
    Then I see no errors

  Scenario: Assert that the plugin no see the errors when we call method with the normal count of arguments
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
             $normalObject = new \Kafkiansky\ReduceArguments\Tests\stubs\ObjectWithoutConstructorArguments();

             $normalObject->do('some', 1);
         }
      }
      """
    When I run Psalm
    Then I see no errors

  Scenario: Assert that the plugin no see the errors when we call function with the normal count of arguments
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
             doSomething('some', 'another');
         }
      }

      function doSomething(string $argument1, string $argument2): void {}
      """
    When I run Psalm
    Then I see no errors

  Scenario: Assert that the plugin no see the errors when we call function without any arguments
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
             doSomething();
         }
      }

      function doSomething(): void {}
      """
    When I run Psalm
    Then I see no errors

  Scenario: Assert that the plugin no see the errors when we call anonymous function without any arguments
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
             $doSomething = function (): void {};

             $doSomething();
         }
      }
      """
    When I run Psalm
    Then I see no errors

  Scenario: Assert that the plugin no see the errors when we call anonymous function with the normal count of arguments
    Given I have the following code
      """
      namespace Kafkiansky\ReduceArguments\Tests\_run;
      <?php
      final class SomeService
      {
         public function entry(): void
         {
             $doSomething = function (string $argument): void {};

             $doSomething('Test');
         }
      }
      """
    When I run Psalm
    Then I see no errors