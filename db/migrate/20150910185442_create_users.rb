<<<<<<< HEAD
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company_name
      t.string :company_address
      t.string :company_city
      t.string :company_state
      t.string :company_country
      t.string :company_email
      t.string :company_phone
      t.boolean :account_activated,:default => false
      t.string :activation_token
      t.string :password_digest


      t.timestamps
    end
  end
end
=======
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company_name
      t.string :company_address
      t.string :company_city
      t.string :company_state
      t.string :company_country
      t.string :company_email
      t.string :company_phone
      t.boolean :account_activated,:default => false
      t.string :activation_token
      t.string :password_digest


      t.timestamps
    end
  end
end
>>>>>>> 61693db46d311cfaea957361435f88a706f0f4c9
