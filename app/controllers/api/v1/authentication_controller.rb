class Api::V1::AuthenticationController < ApplicationController
    skip_before_action :authorize_request, only: :authenticate
    
    # return auth token once user is authenticated
    def authenticate
        auth_token =
        AuthenticateUser.new(auth_params[:email], auth_params[:password]).call
        user = User.find_by(email: auth_params[:email])
        render json: user, serializer: UserSerializer, auth_token: auth_token
    end

    private

    def auth_params
        params.require(:auth).permit(:email, :password)
    end
end
