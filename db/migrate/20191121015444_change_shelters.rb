class ChangeShelters < ActiveRecord::Migration[5.1]
  def change
    change_table :shelters do |t|
      t.rename :addres, :address
    end
  end
end
