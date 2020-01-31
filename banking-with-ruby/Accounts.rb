require_relative './Transactions'

class Account

  def initialize(customer_number)
    @balance = 0
    @overdrafts = 0
    @customer_number = customer_number
    @time_last_accessed = Time.now.getutc

    current_acc_num = File.open(File.dirname(__FILE__ )+"/Accounts.txt", "r").to_a
    #p " #{current_acc_num.last.split(" ")[0]}"
    if(current_acc_num.empty?)
      @account_number = 1000
    else
      @account_number = current_acc_num.last.split(" ")[1].to_i + 1
    end
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
    Transaction.new('d',amount,nil,@account_number)
    current_acc_num = File.open(File.dirname(__FILE__ )+"/Accounts.txt", "r").to_a
    current_acc_num.each_line do |line|
      if(line.split(" ")[1]==@account_number)
        line = line.split(" ")
        line.splice(3, 1, @balance + amount)
      end
    end


    p "Deposit successful #{@balance}"
  end

  def withdrawal(amount)
    transcation = Transaction.new('w',amount,nil,@account_number)
    @balance =- amount
    p "Withdrawal successful #{@balance}"
  end

  def transfer(amount, account_to)
    Transaction.new('t',amount,@account_number,account_to)
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
    account = File.open(File.dirname(__FILE__ )+"/Accounts.txt", "a")
    account.puts "#{@customer_number} #{@account_number} #{@account_type} #{@balance} #{@overdrafts} #{@time_last_accessed}"
  end
end
class Checking < Account
  def initialize(balance, customer_number)
    super(customer_number)
    @account_type = "Checking".freeze
    deposit(balance)
    account_details
    account = File.open(File.dirname(__FILE__ )+"/Accounts.txt", "a")
    account.puts "#{@customer_number} #{@account_number} #{@account_type} #{@balance} #{@overdrafts} #{@time_last_accessed}"
  end
end
