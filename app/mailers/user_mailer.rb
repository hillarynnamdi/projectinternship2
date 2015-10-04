class UserMailer < ActionMailer::Base
  default from: "chrisgeeq@gmail.com"

 def signup_confirmation(user)
 	@user=user
 	@url='http://localhost:3000/signup'
 	mail(:to => user.email,:subject =>'CONFIRM REGISTRATION')
 end


  def forgot_password(user)
 	@user=user
 	mail(:to => user.email,:subject =>'Password Recovery-InvoiceR')
 end

 def invoice_mail(client)
 	@client = client
 	mail(:to => client.email,:subject => 'New Invoice')
 end


end

