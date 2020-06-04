require 'pry'



class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  @@transfers = []
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
    @@transfers << self
  end

  def valid?
    sender.valid? && receiver.valid?
    # binding.pry
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status != 'complete'
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    else
      "Transfer has not been executed yet."
    end
  end
end
