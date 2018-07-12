class SerializableDistrict < JSONAPI::Serializable::Resource
  type :district
  attribute :name
  belongs_to :state
  has_many :people
end
