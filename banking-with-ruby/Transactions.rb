class Transaction
  def initialize(transaction_type, amount, account_from, account_to)
    @transaction_type = transaction_type
    @amount = amount
    @time_stamp = Time.now.getutc
    @account_from = account_from
    @account_to = account_to

    transaction_num = File.open(File.dirname(__FILE__ )+"/Transactions.txt", "r").to_a
    if(transaction_num.empty?)
      @transaction_type = 3000
    else
      @transaction_type =transaction_num.last.split(" ")[0].to_i + 1
    end
    transaction = File.open(File.dirname(__FILE__ )+"/Transactions.txt", "a")
    transaction.puts "#{@tranaction_num} #{transaction_type} #{amount} #{@time_stamp} #{@account_from} #{account_to}"
    transaction.close
  end


  def print_transaction
    p "Transaction Type: #{@transaction_type}"
    p "Amount: #{@amount}"
    p "Time Stamp: #{@time_stamp}"
    p "Account From: #{@account_from}"
    p "Account To: #{@account_to}"
  end
end