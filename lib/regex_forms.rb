# frozen_string_literal: true

require_relative "regex_forms/version"

module RegexForms
  class Error < StandardError; end

  class ValidateCPF
    attr_reader :cpf

    def initialize(cpf)
      @cpf = cpf
    end

    def validate
      regex_cpf(cpf)
    end

    private

    def regex_cpf(cpf)
      if @cpf.nil? || cpf.empty?
        puts "Invalid"
        return { cpf: cpf, validation: false, message: Error.new("CPF is nil or empty") }
      end

      regex = /^(?<t_1>\d{3})\.(?<t_2>\d{3})\.(?<t_3>\d{3})\-(?<t_4>\d{2})$/
      if regex.match(cpf)
        return { cpf: cpf, validation: true, message: "Validated CPF" }
      else
        return { cpf: cpf, validation: false, message: Error.new("Invalid cpf: #{cpf}") }
      end
    end
  end

  class ValidateCNPJ
    attr_reader :cnpj

    def initialize(cnpj)
      @cnpj = cnpj
    end

    def validate
      return invalid_response("CNPJ is nil, empty, or all zeros") if invalid_cnpj?

      regex = /^(?<t_1>\d{2})\.(?<t_2>\d{3})\.(?<t_3>\d{3})\/0001-(?<t_4>\d{2})$/

      if regex.match(cnpj)
        valid_response("Validated CNPJ")
      else
        invalid_response("Invalid CNPJ: #{cnpj}")
      end
    end

    private

    def invalid_cnpj?
      cnpj.nil? || cnpj.empty? || cnpj.gsub(/[^\d]/, "") == "00000000000000"
    end

    def valid_response(message)
      { cnpj: cnpj, validation: true, message: message }
    end

    def invalid_response(message)
      puts "Invalid"
      { cnpj: cnpj, validation: false, message: message }
    end
  end

  class ValidatePassword
    attr_accessor :password

    def initialize(password)
      @password = password
    end

    def validatePassword
      return invalid_response("Password is nil, empty, or all zeros") if invalid_password

      regex = /\A.*(?=.*\d)(?=.*[!@#$%^&*]).*\z/

      if regex.match(password)
        valid_response("Validated Password")
      else
        invalid_response("Must contain at least one digit and one special character: #{password}")
      end
    end

    private

    def valid_response(message)
      { password: password, validation: true, message: message }
    end

    def invalid_password
      password.nil? || password.empty?
    end

    def invalid_response(message)
      { password: password, validation: false, message: message }
    end
  end


  class ValidateEmail
    attr_accessor :email

    def initialize(email)
      @email = email
    end


    def validateEmail
      return invalid_response("Email is nil, empty") if invalid_email

      regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

      if regex.match(email)
        valid_response("Validated Email")
      else
        invalid_response("Must be a valid email address: #{email}")
      end
    end

    private


    def valid_response(message)
      { email: email, validation: true, message: message }
    end

    def invalid_email
      email.nil? || email.empty?
    end

    def invalid_response(message)
      { email: email, validation: false, message: message }
    end

  end

end
