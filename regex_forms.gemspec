# frozen_string_literal: true

require_relative "lib/regex_forms/version"

Gem::Specification.new do |spec|
  spec.name = "regex_forms"
  spec.version = Regex::VERSION
  spec.authors = ["Guiherme Dantas"]
  spec.email = ["gui.dg1@hotmail.com"]

  spec.summary = "lib content regex for forms validation"
  spec.description = "Regex is a versatile Ruby library designed to simplify form validation by providing a collection of regular expressions tailored for common form fields. Whether you're building a web application, validating user input, or processing form submissions, this library offers a set of regex patterns that can be easily integrated into your validation logic."
  spec.homepage = "https://github.com/Dants0/regex_forms"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Dants0/regex_forms"
  spec.metadata["changelog_uri"] = "https://github.com/Dants0/regex_forms"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
