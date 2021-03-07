<?php

declare(strict_types=1);

namespace Kafkiansky\ReduceArguments;

use PhpParser\Node\Expr;
use Psalm\Codebase;
use Psalm\CodeLocation;
use Psalm\Config as PsalmConfig;
use Psalm\Context;
use Psalm\IssueBuffer;
use Psalm\Plugin\Hook\AfterExpressionAnalysisInterface;
use Psalm\StatementsSource;

final class Hook implements AfterExpressionAnalysisInterface
{
    /**
     * {@inheritdoc}
     */
    public static function afterExpressionAnalysis(
        Expr $expr,
        Context $context,
        StatementsSource $statements_source,
        Codebase $codebase,
        array &$file_replacements = []
    ): ?bool {
        if (
            $expr instanceof Expr\MethodCall ||
            $expr instanceof Expr\FuncCall ||
            $expr instanceof Expr\New_ ||
            $expr instanceof Expr\StaticCall
        ) {
            $threshold = self::guessThreshold(5);

            if ($threshold < $realCount = count($expr->args)) {
                $issue = new ReduceArguments($threshold, $realCount, new CodeLocation($statements_source, $expr));

                if (IssueBuffer::accepts($issue, $statements_source->getSuppressedIssues())) {
                    // fall through
                }
            }
        }

        return null;
    }

    /**
     * @param int $default
     *
     * @return int
     */
    private static function guessThreshold(int $default): int
    {
        $config = PsalmConfig::getInstance();

        $threshold = $default;

        if (isset($config->globals['$argumentsCountThreshold'])) {
            $thresholdFromConfig = $config->globals['$argumentsCountThreshold'];

            $threshold = \is_numeric($thresholdFromConfig) ? (int) $thresholdFromConfig : $default;
        }

        return $threshold;
    }
}
