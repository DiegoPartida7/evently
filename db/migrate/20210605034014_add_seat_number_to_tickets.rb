class AddSeatNumberToTickets < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :seat_number, :integer
  end
end
