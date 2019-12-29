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
    if  valid?
      binding.pry 
      self.sender.balance -= self.amount 
      self.receiver.balance += self.amount
      self.status = "complete"
      self.sender.status = "closed"
      self.reciever.status = "closed"
    else 
      self.status = "rejected"
    end
  end
end

