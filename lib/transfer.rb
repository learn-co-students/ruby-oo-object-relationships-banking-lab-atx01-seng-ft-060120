class Transfer
  # your code here
    attr_accessor :sender , :receiver , :amount, :status
    
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
end


def valid? 
@sender.valid?
@receiver.valid? 
end

def execute_transaction
  if self.valid? && @sender.balance > @amount && @status == "pending" then 
    @receiver.deposit(@amount)
    @sender.deposit(-@amount)
    self.status ="complete"
  else 
     @status = "rejected"
    "Transaction rejected. Please check your account balance."
     end
end 

     def reverse_transfer 
       if self.status == "complete" then
         @sender.deposit(@amount)
       @receiver.deposit(-@amount)
       @status = "reversed"
     end
end
end