class SerializableState < JSONAPI::Serializable::Resource
  type :state
  attribute :name
  has_many :districts
end
