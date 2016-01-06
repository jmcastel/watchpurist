class AdminMailer < ApplicationMailer
	default from: "no-reply@watchpurist.com"

	def mandrill_client
		@mandrill_client ||= Mandrill::API.new Mandrill_API_KEY
	end

	def new_message(privatemessage)

		@post = Post.where(id: privatemessage.user_id)

		template.name = "new-message"
		template.content = []

		message = {
			to: [{email: @post.user.email}],
			subject: "New Message",
			merge_vars: [
				{rcpt: "no-reply@watchpurist.com",
					vars: [
						{from_user: "FROM_USER", content: privatemessage.email}
					]

				}
			]
		}

		mandrill_client.messages.send_template template_name, template_content, message


	end
end
