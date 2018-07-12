class SerializableVote < JSONAPI::Serializable::Resource
  type :vote
  belongs_to :voter
  belongs_to :candidate
end
