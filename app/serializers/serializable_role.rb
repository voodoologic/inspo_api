class SerializableRole < JSONAPI::Serializable::Resource
  type :role
  attribute :role_type
  belongs_to :person
end
