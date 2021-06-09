class AddTokenToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :token, :string
    add_column :events, :auth_token, :string
  end
end
