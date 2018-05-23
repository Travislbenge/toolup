class AddColumnToTools < ActiveRecord::Migration[5.2]
  def change
    add_column :tools, :address, :string
  end
end
