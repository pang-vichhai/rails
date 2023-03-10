class ApplicationController < ActionController::API

    class AuthorizationError < StandardError; end

    rescue_from UserAuthenticator::Oauth::AuthenticationError, with: :authentication_oauth_error
    rescue_from UserAuthenticator::Standard::AuthenticationError, with: :authentication_standard_error
    rescue_from AuthorizationError, with: :authorization_error

    before_action :authorize!

    private

    def authorize!       
        raise AuthorizationError unless current_user
    end

    def access_token
        provided_token = request.authorization&.gsub(/\ABearer\s/,'')
        access_token = AccessToken.find_by(token: provided_token)
    end


    def current_name        
        current_user = access_token&.user
    end

    def authentication_oauth_error
        error = {
            "status" => "401",
            "source" => {"pointer" => "/code"},
            "title" => "Authentication code is invalid",
            "detail" => "You must provide valid code in order to change it for token."
        } 
        render json: { "errors" : [error] }, status: 401
    end

    def authentication_stadard_error
        error = {
            "status" => "401",
            "source" => {"pointer" => "/data/attributes/password"},
            "title" => "Invlid login or password",
            "detail" => "You must provide valid credentials in order to exchange them for token."
        } 
        render json: { "errors" : [error] }, status: 401
    end

    def authorization_error
        error = {
            "status" => "401",
            "source" => {"pointer" => "/code"},
            "title" => "Authentication code is invalid",
            "detail" => "You must provide valid code in order to change it for token."
        } 
        render json: { "errors" : [error] }, status: 401
    end
end
