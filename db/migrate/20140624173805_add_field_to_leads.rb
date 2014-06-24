class AddFieldToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :campaign, :string
    add_column :leads, :campaign_date, :date
  end
end
