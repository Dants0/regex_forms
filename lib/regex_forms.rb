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
        return {cpf: cpf, validation: false, message: Error.new("CPF is nil or empty")}
      end

      regex = /^(?<t_1>\d{3})\.(?<t_2>\d{3})\.(?<t_3>\d{3})\-(?<t_4>\d{2})$/
      if regex.match(cpf)
        return {cpf: cpf, validation: true, message: "Validated CPF"}
      else
        return {cpf: cpf, validation: false, message:  Error.new("Invalid cpf: #{cpf}")}
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
      cnpj.nil? || cnpj.empty? || cnpj.gsub(/[^\d]/, '') == '00000000000000'
    end

    def valid_response(message)
      { cnpj: cnpj, validation: true, message: message }
    end

    def invalid_response(message)
      puts "Invalid"
      { cnpj: cnpj, validation: false, message: message }
    end
  end
end
