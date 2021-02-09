class Api::V1::UsersController < ApplicationController
    skip_before_action :authorize_request, only: :create
    
    # POST /signup
    def create
        user = User.create!(user_params)
        auth_token = AuthenticateUser.new(user.email, user.password).call
        render json: user, serializer: UserSerializer, auth_token: auth_token
    end

    private

    def user_params
        params.permit(
        :firstName,
        :lastName,
        :email,
        :password,
        :country
        )
    end
end
