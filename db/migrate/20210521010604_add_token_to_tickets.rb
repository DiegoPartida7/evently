class AddTokenToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :token, :string
    add_column :tickets, :auth_token, :string
  end
end
