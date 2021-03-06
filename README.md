# NuPack Markup Calculator
The NuPack Markup Calculator is designed to solve the following [exercise](exercise.md)


## Getting Started
This guide explains how to use the NuPack Markup Calculator library.

### System Prerequisites
The following are required to use this library:
* [Ruby](https://www.ruby-lang.org/) - Coding language
* [Rspec](http://rspec.info/) - Testing framework

The versions are as follows:
* ruby ~> '2.2.1'
* rspec ~> '3.5'


### Installing prerequisites
To install ruby follow the instructions for your chosen operating system on the official [ruby website](https://www.ruby-lang.org/en/documentation/installation/).

To install rspec

```
gem install rspec 
```


## Using the Markup Library
To use the library it can be simply installed as a gem as follows:
```
gem install nupack-1.0.3.gem
```
Then require the gem at the top of your ruby file:
```
require 'nupack'
```


## To calculate markup
Initialize the markup_calculator as follows:
```
calculator = Nupack::MarkupCalculator.new(base_price, worker_count, materials)
```
It is expected that: 
* base_price is a float
* worker count is an integer
* materials is a string 

The materials currently accepted are 'drugs', 'food', 'electronics'. All other materials are treated as 'other' with no markup rate

To calculate markup:
```
markup_price = calculator.calculate_markup!
```
A float is output as the total markup.

It is assumed that all currency considerations are treated externally to the library

Example: 
```
calculator = Nupack::MarkupCalculator.new(1299.99, 3, 'food')
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


