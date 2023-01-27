class AccessTokenController < ApplicationController
    def create
        authenticator = UserAuthenticator.new(params[:code])
        begin
            authenticator.perform
        rescue UserAuthenticator::AuthenticationError
        end
    end

    private
    
    def authentication_error
        error = {
            "status" => "401",
            "source" => {"pointer" => "/code"},
            "title" => "Authentication code is invalid",
            "detail" => "You must provide valid code in order to change it for token."
        } 
        render json: { "error" : [error] }, status: 401
    end
end