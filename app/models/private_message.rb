class PrivateMessage < ActiveRecord::Base

	belongs_to :user,  dependent: :delete
	belongs_to :post,  dependent: :delete

	after_create :send_notification

	def send_notification
		
		AdminMailer.new_message(self).deliver 
	end

end
