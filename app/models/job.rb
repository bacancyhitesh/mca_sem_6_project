class Job < ApplicationRecord
  belongs_to :company
  belongs_to :job_type
  belongs_to :role
  belongs_to :education
  has_and_belongs_to_many :skills
  has_many :job_applies
  has_many :users, through: :job_applies

  attr_reader :user_skills
#Ketan
  before_save do
    if start_date<Date.today && end_date > Date.today
      self.status="Active"
    else
      self.status="Deactive"
    end
  end

  def status
      if self.start_date<Date.today && self.end_date > Date.today
        self.status="Active"
      else
        self.status="Deactive"
      end
  end

  def user_skills=(ids)
      self.skill_ids = ids.split(",")
  end

end
