class AddSoldToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :sold, :integer, array: true, default: []
  end
end
