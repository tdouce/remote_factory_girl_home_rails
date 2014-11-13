class UserSerializer < ActiveModel::Serializer
  attributes :first_name

  def first_name
    'active_model_serializer_first_name'
  end
end
