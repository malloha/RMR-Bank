class Customer

  def initialize(first_name, last_name,ssn, address)
    @first_name = first_name
    @last_name = last_name
    @ssn = ssn
    @address = address

    customer_num = File.open(File.dirname(__FILE__ )+"/Customers.txt", "r").to_a
    if(customer_num.empty?)
      @customer_number = 2000
    else
    @customer_number =customer_num.last.split(" ")[0].to_i + 1
    end
    customer = File.open(File.dirname(__FILE__ )+"/Customers.txt", "a")
    customer.puts "#{@customer_number} #{@first_name} #{@last_name} #{@ssn} #{@address}"
    customer.close

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