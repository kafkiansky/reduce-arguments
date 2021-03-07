<?php

declare(strict_types=1);

namespace Kafkiansky\ReduceArguments\Tests\stubs;

final class FatObject
{
    private $argument1;
    private $argument2;
    private $argument3;
    private $argument4;
    private $argument5;
    private $argument6;
    private $argument7;
    private $argument8;
    private $argument9;

    public function __construct(
        string $argument1,
        string $argument2,
        int $argument3,
        bool $argument4,
        string $argument5,
        array $argument6,
        int $argument7,
        bool $argument8,
        callable $argument9
    ) {
        $this->argument1 = $argument1;
        $this->argument2 = $argument2;
        $this->argument3 = $argument3;
        $this->argument4 = $argument4;
        $this->argument5 = $argument5;
        $this->argument6 = $argument6;
        $this->argument7 = $argument7;
        $this->argument8 = $argument8;
        $this->argument9 = $argument9;
    }

    public static function create(
        string $argument1,
        string $argument2,
        int $argument3,
        bool $argument4,
        string $argument5,
        array $argument6,
        int $argument7,
        bool $argument8,
        callable $argument9
    ): FatObject {
        return new FatObject(
            $argument1,
            $argument2,
            $argument3,
            $argument4,
            $argument5,
            $argument6,
            $argument7,
            $argument8,
            $argument9
        );
    }
}
