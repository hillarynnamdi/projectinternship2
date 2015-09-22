class UserMailer < ActionMailer::Base
  default from: "chrisgeek@gmail.com"

 def signup_confirmation(user)
 	@user=user
 	@url='http://localhost:3000/signup'
 	mail(:to => user.email,:subject =>'CONFIRM REGISTRATION')
 end
<<<<<<< HEAD

  def forgot_password(user)
 	@user=user
 	mail(:to => user.email,:subject =>'Password Recovery-InvoiceR')
 end
=======
>>>>>>> 61693db46d311cfaea957361435f88a706f0f4c9
 	
end

