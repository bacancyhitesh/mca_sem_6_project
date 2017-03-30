# pratik & ketan
class Skill < ApplicationRecord
  has_many :ownskills
  has_many :experiences, through: :ownskills
  has_and_belongs_to_many :jobs
end
