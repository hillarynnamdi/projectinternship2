class Client < ActiveRecord::Base
	before_save { self.email = email.downcase }
	belongs_to :user



	validates:first_name, presence:true
	validates:first_name,
	 length: { maximum: 50 },if: "first_name.present?"
	

	validates:last_name, presence:true
	validates:last_name, 
	length: { maximum: 50 },if: "last_name.present?"


	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


	validates:email, presence:true
	validates:email, 
	format: { with: VALID_EMAIL_REGEX },if: "email.present?"
	

	validates:phone_number, presence: true
	validates:phone_number,
	numericality:{only_integer:true},if: "phone_number.present?"
	validates:phone_number,
	length: { minimum: 11 },if: "phone_number.present?"


	validates:address, presence:true
	validates:address,
	length: { maximum: 50 },if: "address.present?"


	validates:city, presence:true
	validates:city, 
	length: { maximum: 50 },if: "city.present?"
	

	validates:state, presence:true
	validates:state, length: { maximum: 50 },if: "state.present?"


end
