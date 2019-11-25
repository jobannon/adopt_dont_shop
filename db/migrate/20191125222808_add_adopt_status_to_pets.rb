class AddAdoptStatusToPets < ActiveRecord::Migration[5.1]
  def change
    add_column :pets, :adopt_status, :boolean, default: true
  end
end
