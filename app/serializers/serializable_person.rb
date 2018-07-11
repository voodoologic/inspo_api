class SerializablePerson < JSONAPI::Serializable::Resource
  type :person
  attribute :first_name
  attribute :last_name
  attribute :email
end
