# Psalm plugin that helps to detect the fat objects and functions/methods calls.

![test](https://github.com/kafkiansky/reduce-arguments/workflows/test/badge.svg?event=push)
[![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](LICENSE.md)
[![Quality Score](https://img.shields.io/scrutinizer/g/kafkiansky/reduce-arguments.svg?style=flat-square)](https://scrutinizer-ci.com/g/kafkiansky/reduce-arguments)
[![StyleCI](https://styleci.io/repos/345302811/shield)](https://styleci.io/repos/345302811)
[![Total Downloads](https://img.shields.io/packagist/dt/kafkiansky/reduce-arguments.svg?style=flat-square)](https://packagist.org/packages/kafkiansky/reduce-arguments)
<a href="https://packagist.org/packages/kafkiansky/reduce-arguments"><img src="https://poser.pugx.org/kafkiansky/reduce-arguments/v/stable" alt="Latest Stable Version"></a>

### Contents:
- [Installation](#installation)
- [Configuration](#configuration)
- [Testing](#testing)
- [License](#license)

## Installation

Install this package with Composer:

```
composer require kafkiansky/reduce-arguments --dev
```

## Configuration

If you want to use your own threshold, set the `argumentsCountThreshold` global variable in `psalm.xml` configuration:
```xml
...
<globals>
     <var name="argumentsCountThreshold" type="6" />
</globals>
...
```

By default, plugin use 5 as threshold.

## Testing

``` bash
$ composer test
```  

## License

The MIT License (MIT). See [License File](LICENSE.md) for more information.
