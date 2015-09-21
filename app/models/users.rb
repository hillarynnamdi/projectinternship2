
class Users < ActiveRecord::Base
	has_many :clients
	before_create :confirmation_token 
	before_create {generate_token(:auth_token)}
	before_save { self.email = email.downcase }

	#with_options presence: :true do |pres|


	

	validates:first_name, presence:true,
	length: { maximum: 50 },if: "first_name.present?"
	

	#validates:first_name, length: { maximum: 50 },if: "first_name.present?"
	

	validates:last_name, presence:true
	validates:last_name, length: { maximum: 50 },if: "last_name.present?"

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates:email, presence:true
	validates:email, format: { with: VALID_EMAIL_REGEX },if: "email.present?"
	validates:email, uniqueness: { case_sensitive: false },if: "email.present?"
	
	validates:company_name, presence:true
	validates:company_name, uniqueness:true,if: "company_name.present?"
	validates:company_name, length: { maximum: 50 },if: "company_name.present?"



	validates:company_address, presence:true
	validates:company_address,length: { maximum: 50 },if: "company_address.present?"

	validates:company_city, presence:true
	validates:company_city, length: { maximum: 50 },if: "company_city.present?"

	validates:company_state, presence:true
	validates:company_state, length: { maximum: 50 },if: "company_state.present?"


	validates:company_country, presence:true
	validates:company_country, length: { maximum: 50 } ,if: "company_country.present?"

	
	validates:company_email, presence:true
	validates:company_email, format: { with: VALID_EMAIL_REGEX },if: "company_email.present?"
	validates:company_email, length: { maximum: 255 }


	validates:company_phone, presence: true
	validates:company_phone,numericality:{only_integer:true},if: "company_phone.present?"
	validates:company_phone,length: { minimum: 11 },if: "company_phone.present?"
	

has_secure_password


	
	def generate_token(column)
		begin
			self[column] =SecureRandom.urlsafe_base64
		end
			while Users.exists?(column=>self[column])
		end
	end



	private
		def confirmation_token
			if self.activation_token.blank?
				self.activation_token = SecureRandom.urlsafe_base64.to_s
		end
	end



end
