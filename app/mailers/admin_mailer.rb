class AdminMailer < ApplicationMailer
	default from: "no-reply@watchpurist.com"

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new Mandrill_API_KEY
	end

	def new_message(privatemessage)

		

		template_name = "new-message"
		template_content = []

		message = {
			to: [{email: "jmcastel@me.com"}],
			subject: "New Message",
			merge_vars: [
				{rcpt: "jmcastel@me.com",
					vars: [
						{from_user: "FROM_USER"}
					]

				}
			]
		}

		mandrill_client.messages.send_template template_name, template_content, message


	end
end
