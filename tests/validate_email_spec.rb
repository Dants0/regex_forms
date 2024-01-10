# validate_email_spec.rb
require_relative "../lib/regex_forms"
require "rspec"

RSpec.describe RegexForms::ValidateEmail do
  describe "#validateEmail" do
    context "with a valid email" do
      it "returns a valid response" do
        email = "guilhermedantasgoes@gmail.com"
        validator = RegexForms::ValidateEmail.new(email)
        result = validator.validateEmail

        expect(result[:validation]).to be_truthy
        expect(result[:message]).to eq("Validated Email")
      end
    end

    context "with an invalid email" do
      it "returns an invalid response" do
        invalid_email = "dgmail.com"
        validator = RegexForms::ValidateEmail.new(invalid_email)
        result = validator.validateEmail

        expect(result[:validation]).to be_falsy
        expect(result[:message]).to include("Must be a valid email address")
      end
    end

    context "with a nil email" do
      it "returns an invalid response" do
        validator = RegexForms::ValidateEmail.new(nil)
        result = validator.validateEmail

        expect(result[:validation]).to be_falsy
        expect(result[:message]).to include("Email is nil")
      end
    end

    context "with an empty email" do
      it "returns an invalid response" do
        validator = RegexForms::ValidateEmail.new("fulanodetal@gmail.com")
        result = validator.validateEmail

        expect(result[:validation]).to be_falsy
        #erro proposital na linha 46
        expect(result[:message]).to include("Email is nil")
      end
    end
  end
end
