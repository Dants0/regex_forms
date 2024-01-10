# validate_password_spec.rb
require_relative "../lib/regex_forms"
require "rspec"

RSpec.describe RegexForms::ValidatePassword do
  describe "#validatePassword" do
    context "with a valid password" do
      it "returns a valid response" do
        password = "ValidP@ssw0rd!"
        validator = RegexForms::ValidatePassword.new(password)
        result = validator.validatePassword

        expect(result[:validation]).to be_truthy
        expect(result[:message]).to eq("Validated Password")
      end
    end

    context "with an invalid password" do
      it "returns an invalid response" do
        password = "InvalidPassword"
        validator = RegexForms::ValidatePassword.new(password)
        result = validator.validatePassword

        expect(result[:validation]).to be_falsy
        expect(result[:message]).to include("Must contain at least one digit and one special character")
      end
    end

    context "with a nil password" do
      it "returns an invalid response" do
        validator = RegexForms::ValidatePassword.new(nil)
        result = validator.validatePassword

        expect(result[:validation]).to be_falsy
        expect(result[:message]).to include("Password is nil, empty, or all zeros")
      end
    end

    context "with an empty password" do
      it "returns an invalid response" do
        validator = RegexForms::ValidatePassword.new("")
        result = validator.validatePassword

        expect(result[:validation]).to be_falsy
        expect(result[:message]).to include("Password is nil, empty, or all zeros")
      end
    end
  end
end
