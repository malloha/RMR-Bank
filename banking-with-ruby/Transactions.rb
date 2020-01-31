class Transaction
  def initialize(transaction_type, amount, account_from, account_to)
    @transaction_type = transaction_type
    @amount = amount
    @time_stamp = Time.now.getutc
    @account_from = account_from
    @account_to = account_to
  end


  def print_transaction
    p "Transaction Type: #{@transaction_type}"
    p "Amount: #{@amount}"
    p "Time Stamp: #{@time_stamp}"
    p "Account From: #{@account_from}"
    p "Account To: #{@account_to}"
  end
end