class CreateFactQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.bigint :QuoteId
      t.timestamp :Creation
      t.text :Company_Name
      t.text :Email
      t.integer :NbElevator

      t.timestamps
    end
  end
end
