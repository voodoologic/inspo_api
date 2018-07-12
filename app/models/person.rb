class Person < ApplicationRecord
  has_many :person_roles
  has_many :roles, through: :person_roles
  belongs_to :district
  has_one :vote, foreign_key: :voter_id
  has_one :candidate, through: :vote, foreign_key: :candidate_id
  delegate :state, to: :district
end
