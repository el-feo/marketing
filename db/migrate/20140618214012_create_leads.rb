class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :phase
      t.string :first_name
      t.string :last_name
      t.string :company_name
      t.string :title
      t.string :email
      t.string :domain
      t.string :city
      t.string :category_1
      t.string :category_2
      t.string :category_3
      t.timestamps
    end
    add_index :leads, :email, :unique => true
    add_index :leads, :phase
    add_index :leads, :title
    add_index :leads, :company_name
    add_index :leads, :city
  end
end
