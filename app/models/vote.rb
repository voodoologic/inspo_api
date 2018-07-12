class Vote < ApplicationRecord
  belongs_to :voter, foreign_key: :voter_id, class_name: 'Person'
  belongs_to :candidate, foreign_key: :candidate_id, class_name: 'Person'
end
