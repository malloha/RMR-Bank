require_relative './Transactions'

class Account
  @@account_serial_number = 1
  def initialize(customer_number)
    @balance = 0
    @overdrafts = 0
    @customer_number = customer_number
    @time_last_accessed = Time.now.getutc
    @account_number = @@account_serial_number
    @@account_serial_number =+ 1
  end
  def account_details
    p "Customer Number: #{@customer_number}"
    p "Account Type: #{@account_type}"
    p "Balance: #{@balance}"
    p "Overdrafts: #{@overdrafts}"
    p "Account Number: #{@account_number}"
    p "Time Last Accessed: #{@time_last_accessed}"
  end


  def deposit(amount)
    transcation = Transaction.new('d',amount,nil,@account_number)
    @balance =+ amount
    p "Deposit successful #{@balance}"
  end

  def withdrawal(amount)
    transcation = Transaction.new('d',amount,nil,@account_number)
    @balance =- amount
    p "Withdrawal successful #{@balance}"
  end

  def transfer(amount, account_to)
    Transaction.new('d',amount,@account_number,account_to)
    @balance =- amount
    p "Transfer Successfull #{@balance}"
  end

end
class Savings < Account
  def initialize(balance, customer_number)
    super(customer_number)
    @account_type = "Savings".freeze
    deposit(balance)
    account_details
  end
end
class Checking < Account
  def initialize(balance, customer_number)
    super(customer_number)
    @account_type = "Checking".freeze
    deposit(balance)
    account_details
  end
end
