class PrivateMessage < ActiveRecord::Base

	belongs_to :user
	belongs_to :post

	after_create :send_notification

	def send_notification
		
		AdminMailer.new_message(self).deliver 
	end

	def readingmessage
  		self.read_at ||= Time.now
  		save
	end

end
