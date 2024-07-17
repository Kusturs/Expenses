class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.string :product
      t.text :description
      t.integer :amount

      t.timestamps
    end
  end
end
