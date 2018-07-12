class SerializablePerson < JSONAPI::Serializable::Resource
  type :person
  attribute :first_name
  attribute :last_name
  attribute :email
  has_one :district
  has_many :roles
end
