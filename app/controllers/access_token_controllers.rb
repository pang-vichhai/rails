class AccessTokenController < ApplicationController
    before_action :authorized!, only: :destroy
    def create
        authenticator = UserAuthenticator.new(params[:code])
        authenticator.perform

        render json: authenticator.access_token, status: :created
    end

    def destroy
        current_user.access_token.destroy
    end
end