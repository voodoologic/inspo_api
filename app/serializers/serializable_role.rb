class SerializableRole < JSONAPI::Serializable::Resource
  type :role
  attribute :role_type
  belongs_to :person
  belongs_to :role
end
