<?php

declare(strict_types=1);

namespace Kafkiansky\ReduceArguments\Tests\stubs;

final class ObjectWithAnObjectArgument
{
    private $argument1;
    private $argument2;

    public function __construct(string $argument1, object $argument2)
    {
        $this->argument1 = $argument1;
        $this->argument2 = $argument2;
    }

    public static function create(string $argument1, object $argument2)
    {
        return new ObjectWithAnObjectArgument($argument1, $argument2);
    }
}
