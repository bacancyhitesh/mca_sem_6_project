class RemoveQualificationFromJob < ActiveRecord::Migration[5.0]
  def change
    remove_column :jobs, :qualification, :string
  end
end
