# Regex Forms

Welcome to the Regex Forms gem! This gem provides functionalities for validating Brazilian CPF and CNPJ numbers. In this directory, you'll find the necessary files to package your Ruby library into a gem. Put your Ruby code in the file `lib/regex_forms`. To experiment with the code, run `bin/console` for an interactive prompt.

## Installation - Gemfile

Add the following line to your application's Gemfile:

```ruby
gem 'regex_forms'
```

Install the gem and add it to the Gemfile by executing:

```bash
$ bundle add regex_forms
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
$ gem install regex_forms
```

## Usage

```ruby
require 'regex_forms'

obj_1 = RegexForms::ValidateCPF.new('123.123.123-06')
obj_2 = RegexForms::ValidateCNPJ.new('11.111.111/0001-01')
result1 = obj_1.validate
result2 = obj_2.validate

puts result1, result2
```

This will return an object containing three parameters: "(cpf or cnpj), validation, message".

- The first parameter is the value passed in for verification.
- The second parameter is a boolean.
- The third parameter is a return message, indicating success or failure.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`. This will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on [GitHub](https://github.com/dants0/regex_forms).