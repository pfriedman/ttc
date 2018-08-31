class OrganizationSerializer < ActiveModel::Serializer
  attributes :id, :name, :city, :state, :postal, :category
end
