class AddQutoToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :quote_form, foreign_key: true
  end
end
