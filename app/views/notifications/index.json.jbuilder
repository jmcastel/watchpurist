json.array! @notifications do |notification|
	#json.recipient notification.recipient
	if notification.actor.present?
		json.actor notification.actor.pseudo
	else 
		json.actor "someone"
	end
	json.action notification.action
	json.notifiable notification.notifiable
	json.url messages_path
end



