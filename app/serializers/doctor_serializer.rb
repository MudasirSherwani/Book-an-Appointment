class DoctorSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :city, :description, :speciality, :created_at
end
