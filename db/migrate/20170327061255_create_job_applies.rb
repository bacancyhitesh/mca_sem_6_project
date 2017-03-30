class CreateJobApplies < ActiveRecord::Migration[5.0]
  def change
    create_table :job_applies do |t|
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true
      t.boolean :seen

      t.timestamps
    end
  end
end
