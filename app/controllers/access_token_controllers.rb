class AccessTokenController < ApplicationController
    before_action :authorized!, only: :create
    def create
        authenticator = UserAuthenticator.new(authentication_params)
        authenticator.perform

        render json: authenticator.access_token, status: :created
    end

    def destroy
        current_user.access_token.destroy
    end

    def destroy
        params.permit(:code).to_h.symbolize_keys
    end
end