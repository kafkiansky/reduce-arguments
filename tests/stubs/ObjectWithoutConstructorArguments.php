<?php

declare(strict_types=1);

namespace Kafkiansky\ReduceArguments\Tests\stubs;

final class ObjectWithoutConstructorArguments
{
    public static function create(): ObjectWithoutConstructorArguments
    {
        return new ObjectWithoutConstructorArguments();
    }

    public function do(string $argument1, int $argument2): void
    {
    }
}
