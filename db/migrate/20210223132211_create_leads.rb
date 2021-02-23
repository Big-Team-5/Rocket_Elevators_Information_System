class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :Full_Name
      t.string :Company_Name
      t.string :Email
      t.string :Phone
      t.string :Project_Name
      t.string :Project_Description
      t.string :Department_In_Charge
      t.string :Message

      t.timestamps
    end
  end
end
