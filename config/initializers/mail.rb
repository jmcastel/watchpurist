
Mandrill_API_KEY = "rcujI-Da5B-Iyh7jMaf6HQ"

ActionMailer::Base.smtp_settings = {
	address: "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "contact@watchpurist.com",
	password: Mandrill_API_KEY,
	authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"