class AddForgotResetSectionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :forgot_token, :string
    add_column :users, :forgot_token_sent_at, :datetime
  end
end
