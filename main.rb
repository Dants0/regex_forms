require_relative "./lib/regex_forms"

password = "Myp@ssw0rd"

obj = RegexForms::ValidatePassword.new(password)

puts "Teste #{obj.validatePassword}"



valider_email = RegexForms::ValidateEmail.new(nil)


puts "Teste valider_email #{valider_email.validateEmail}"
