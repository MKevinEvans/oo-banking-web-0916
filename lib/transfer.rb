require 'pry'

class Transfer
attr_accessor :status, :amount
attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@amount = amount
  	@status = "pending"
  end

  def valid?
  	@sender.valid? && @receiver.valid?
  end

  def execute_transaction
  	if !@sender.valid? || (@sender.balance - @amount) < 0
  		@status = "rejected"
  		"Transaction rejected. Please check your account balance."
  	elsif @status == "complete"

  	else
  		@sender.balance -= @amount
  		@receiver.balance += @amount
  		@status = "complete" 
  	end
  end

  	def reverse_transfer
  		if @status == "complete"
  			@sender.balance += @amount
  			@receiver.balance -= @amount
  			@status = "reversed" 
  		end
  	end
end
