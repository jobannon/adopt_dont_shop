class ChangeTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :shelter_names, :shelters
  end
end
