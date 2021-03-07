<?php

declare(strict_types=1);

namespace Kafkiansky\ReduceArguments;

use Psalm\CodeLocation;
use Psalm\Issue\PluginIssue;

final class ReduceArguments extends PluginIssue
{
    public function __construct(int $threshold, int $realCount, CodeLocation $codeLocation)
    {
        parent::__construct(
            sprintf(
                'You have exceeded the normal number of arguments: the limit is %d, but you have %d. Reduce it.',
                $threshold,
                $realCount,
            ),
            $codeLocation
        );
    }
}
