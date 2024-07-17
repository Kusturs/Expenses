class AddMissingNullChecks < ActiveRecord::Migration[7.1]
  def change
    change_column_null :payments, :product, false
    change_column_null :payments, :amount, false
    change_column_null :comments, :body, false
  end
end
