<?php

declare(strict_types=1);

namespace Kafkiansky\ReduceArguments\Tests\stubs;

final class ObjectWithConstructorArguments
{
    private $argument;

    public function __construct(string $argument)
    {
        $this->argument = $argument;
    }

    public static function create(string $argument): ObjectWithConstructorArguments
    {
        return new ObjectWithConstructorArguments($argument);
    }
}
