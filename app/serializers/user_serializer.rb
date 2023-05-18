class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :gender, :age, :email, :jti, :created_at
end
