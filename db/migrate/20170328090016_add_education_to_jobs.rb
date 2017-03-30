class AddEducationToJobs < ActiveRecord::Migration[5.0]
  def change
    add_reference :jobs, :education, foreign_key: true, :after => :salary
  end
end
