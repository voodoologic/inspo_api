class Person < ApplicationRecord
  has_many :roles, through: :person_roles
  belongs_to :district
  delegate :state, to: :district
end
