require 'pry'

class Transfer

  attr_reader :sender, :receiver, :status, :amount 
  attr_writer :status 
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 

  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction
    if  valid? && self.status == "pending" && self.sender.balance > self.amount
      self.sender.balance -= self.amount 
      self.receiver.balance += self.amount
      self.status = "complete"
    else 
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer 
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
  
end






