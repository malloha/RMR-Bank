require_relative './Customer'
require_relative './Transactions'
require_relative './Accounts'


def menu
  loop do
  puts "Welcome to RMR bank"
  puts "MENU Options"
  puts "New Customer Press 1"
  puts "Existing Customer Press 2 "
  puts "To exit press 0"
  option = gets.chomp.to_i

#NEW CUSTOMER MENU
  if(option == 1)
    p "Enter First Name"

    first_name=gets.chomp
    p "Enter Last Name"

    last_name=gets.chomp
    p "Enter SSN"

    ssn=gets.chomp
    p "Enter Address"
    address = gets.chomp
    customer = Customer.new(first_name,last_name,ssn,address)

    p "Create Checking Account Press 1"
    p "Create Savings Account Press 2"


    acc_option= gets.chomp.to_i
    if(acc_option == 1)
      p "Enter opening balance:"
      balance = gets.chomp.to_i
      customer.create_checking_account(balance)
    elsif(acc_option == 2)
      p "Enter opening balance:"
      balance = gets.chomp.to_i
      customer.create_savings_account(balance)
    else
      p "invalid option"
    end
#EXISTING CUSTOMER MENU
    elsif(option == 2)
    p "To Create a New Account Press 1"
    p "To Make a Transaction Press 2"
    p "To Display all Transactions Press 3"

    acc_option= gets.chomp.to_i

    if(acc_option == 1)

    elsif(acc_option == 2)
      p "To make a deposit Press 1"

      p "To make a withdrawal Press 2"
      acc_option= gets.chomp.to_i

      if(acc_option == 1)
        p "Enter Customer Number"
        current_customer = gets.chomp

        p "Enter Account Number"
        current_account = gets.chomp

        p "Enter deposit amount"
        amount = gets.chomp.to_i

        current_acc = Account.new(current_customer)
        current_acc.account_number = current_account
        current_acc.deposit(amount)

      end
      elsif(acc_option == 2)

    else
      p "invalid option"
    end
  elsif(option == 3)



  elsif(option == 0)

  else
    p "Invalid option entered. Enter a valid option"
  end

  break if option == 0
  end
end

menu