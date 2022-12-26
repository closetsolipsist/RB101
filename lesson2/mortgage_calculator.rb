def prompt(text)
  puts ">> #{text}"
end

def is_valid_float(str)
  str.to_f.to_s == str || str.to_i.to_s == str
end

loan_amount = nil
loop do
  prompt "What is the loan amount?"
  loan_amount = gets.chomp
  if is_valid_float(loan_amount)
    loan_amount = loan_amount.to_f
    break
  else
    prompt "Invalid loan amount, please try again"
  end
end

apr = nil
loop do
  prompt "What is the APR?"
  apr = gets.chomp
  if is_valid_float(apr)
    apr = apr.to_f
    break
  else
    prompt "Invalid APR, please try again"
  end
end

loan_duration_in_years = nil
loop do
  prompt "What is the loan duration?"
  loan_duration_in_years = gets.chomp
  if is_valid_float(loan_duration_in_years)
    loan_duration_in_years = loan_duration_in_years.to_f
    break
  else
    prompt "Invalid loan duration, please try again"
  end
end

monthly_interest_rate = apr / 12 / 100
loan_duration_in_months = 12 * loan_duration_in_years
monthly_payment = loan_amount * (monthly_interest_rate / (1 - (1 + monthly_interest_rate) ** -loan_duration_in_months))
puts "Your monthly interest rate is #{monthly_interest_rate*100}%."
puts "Your loan duration in months is #{loan_duration_in_months}."
puts "Your monthly payment is #{monthly_payment}."
