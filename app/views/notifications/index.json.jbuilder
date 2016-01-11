json.array! @notifications do |notification|
	#json.recipient notification.recipient
	json.actor notification.actor.pseudo
	json.action notification.action
	json.notifiable notification.notifiable
	json.url messages_path
end



