class Customer
  @@customer_serial_num = 1000
  def initialize(first_name, last_name,ssn, address)
    @first_name = first_name
    @last_name = last_name
    @ssn = ssn
    @address = address
    @customer_number= @@customer_serial_num
    @@customer_serial_num += 1
    p "Customer created"
    print_details
  end
  def print_details
    p "Customer Name: #{@first_name} #{@last_name}"
    p "SSN: #{@ssn}"
    p "Address: #{@address}"
    p "Customer Account Number:  #{@customer_number}"
  end
  def create_checking_account(balance)
    Checking.new(balance, @customer_number)
  end
  def create_savings_account(balance)
    Savings.new(balance, @customer_number)
  end
end