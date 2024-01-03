# Regex

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/regex`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation - Gemfile

gem 'regex_forms'

Install the gem and add to the application's Gemfile by executing:

    $ bundle add regex_forms

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install regex_forms

## Usage

```bash

require 'regex_forms'


obj_1 = Regex::ValidateCPF.new('123.123.123-06')
obj_2 = Regex::ValidateCNPJ.new('11.111.111/0001-01')
result1 = obj_1.validate
result2 = obj_2.validate

puts result1, result2

```

This will return an object containing three parameters, "(cpf or cnpj), validation, message". 

The first parameter is the value passed in for verification.

The second parameter is a boolean

The third parameter is a return message, whether it was successful or failed.



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dants0/regex.#   r e g e x _ f o r m s  
 