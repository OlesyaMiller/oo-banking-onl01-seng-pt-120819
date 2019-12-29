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
  
end

