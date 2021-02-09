class UserSerializer < ActiveModel::Serializer
  attributes :id, :token, :email, :name, :country, :created_at, :updated_at

  def token
    @instance_options[:auth_token]
  end

  def name
    @user = User.find(object.id)
    @completeName = @user.firstName + " " + @user.lastName
    @completeName
  end
end
