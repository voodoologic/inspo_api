class District < ApplicationRecord
  belongs_to :state
  has_many :people
  def candidates
    people.select{ |p| p.candidate? }
  end
end
