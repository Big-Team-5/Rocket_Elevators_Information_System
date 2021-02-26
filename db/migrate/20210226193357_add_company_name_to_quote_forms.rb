
class AddCompanyNameToQuoteForms < ActiveRecord::Migration[5.2]
    def change
      add_column :quote_forms, :company_name, :string
    end
  end