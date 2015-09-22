class Clients < ActiveRecord::Base
	before_save { self.email = email.downcase }
	belongs_to :user

	#validates:first_name, presence:true

	validates:first_name, presence:true
	validates:first_name, length: { maximum: 50 },if: "first_name.present?"
	

	validates:last_name, presence:true
	validates:last_name, length: { maximum: 50 },if: "last_name.present?"

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates:email, presence:true
	validates:email, format: { with: VALID_EMAIL_REGEX },if: "email.present?"
	validates:email, uniqueness: { case_sensitive: false },if: "email.present?"


end
