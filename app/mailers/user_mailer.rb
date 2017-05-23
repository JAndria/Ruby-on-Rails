class UserMailer < ApplicationMailer
  default from: "TestShop@email.com"

  def contact_form(email, name, message)
  @message = message
    mail(from: email,
         to: 'hilliard.jan@gmail.com',
         subject: "A new contact form message from #{name}")
  end
end