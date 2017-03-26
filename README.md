# NuPack Markup Calculator

The NuPack Markup Calculator is designed to solve the following [exercise](exercise.md)

## Getting Started

These guide explains how to use the NuPack Markup Calculator library.

## Built With

* [Ruby](https://www.ruby-lang.org/) - Coding language
* [Rspec](http://rspec.info/) - Testing framework

### System Prerequisites

The following installations are required to use this library:

*ruby ~> '2.2.1'
*rspec ~> '3.5'

### Installing prerequisites

To install ruby follow the instructions for your chosen operating system on the official [ruby website](https://www.ruby-lang.org/en/documentation/installation/).

To install rspec

```
gem install rspec 
```

## Using the Markup Library
To use the library, simply add the following to the top of your ruby file:
```
require "markup_calculator"
```

## To calculate markup
Initialize the markup_calculator as follows:
```
calculator = MarkupCalculator.new(base_price, worker_count, materials)
```
It is expected that: 
* base_price is a float
* worker count is an integer
* materials is a string. 

The materials currently accepted are 'drugs', 'food', 'electronics'. All other materials are treated as 'other' with no markup rate

To calculate markup:
```
markup_price = calculator.calculate_markup!
```
A float is output as the total markup.

It is assumed that all currency considerations are treated externally to the library

Use: 
```
calculator = MarkupCalculator.new(1299.99, 3, 'food')
markup_price = calculator.calculate_markup!
```

## Running the tests

The NuPack Markup Calculator uses rspec as a test framework. To run the tests simply run the following command:

```
rspec spec
```

## Authors

Carol Dawson - [CarolDaw](https://github.com/CarolDaw)

## Acknowledgments

* This exercise was set by [Nulogy](https://nulogy.com/)

