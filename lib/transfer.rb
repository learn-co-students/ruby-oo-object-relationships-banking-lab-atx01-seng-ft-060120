class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

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
        self.status = "complete"
      else 
        reject_trans
      end 

    end 

    def reject_trans
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

    def reverse_transfer
      if self.valid? && @receiver.balance > @amount && @status == "complete" then
        @receiver.deposit(-@amount)
        @sender.deposit(@amount)
        self.status = "reversed"
      else 
        reject_trans
    end 
  end 

end
