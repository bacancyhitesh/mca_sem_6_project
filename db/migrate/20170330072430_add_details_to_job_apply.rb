class AddDetailsToJobApply < ActiveRecord::Migration[5.0]
  def change
    add_column :job_applies, :downloaded, :boolean
    add_column :job_applies, :rejected, :boolean
  end
end
