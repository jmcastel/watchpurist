class AdminMailer < ApplicationMailer
	default from: "no-reply@watchpurist.com"

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new Mandrill_API_KEY
	end

	def new_message(privatemessage)

		
		logger.debug "new_message func started"
		

		template_name = "new-message"
		template_content = []

		message = {
			to: [{email: privatemessage.poster_email}],
			subject: "New Message",
			merge_vars: [
				{rcpt: privatemessage.poster_email,
					vars: [
						{name: "FROM_USER" , content: privatemessage.email},
						{name: "USER_NAME" , content: privatemessage.pseudo},
						{name: "POST_TITLE" , content: privatemessage.post_title},
						{name: "CONTENT" , content: privatemessage.content},
						{name: "TITLE" , content: privatemessage.title}

					]

				}
			]
		}

		mandrill_client.messages.send_template template_name, template_content, message


	end
end
