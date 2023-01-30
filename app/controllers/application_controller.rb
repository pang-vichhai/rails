class ApplicationController < ActionController::API
    include JsonapiErrorsHandler
    ErrorMapper.map_errors!(
        'ActiveRecord::RecordNotFound' => 'JsonapiErrorsHandler::Errors::NotFound'
    )
    rescue_from ::StandardError, with: lambda { |e| handle_error(e) }

    class AuthorizationError < StandardError; end

    rescue_from UserAuthenticator::AuthenticationError, with: :authentication_error

    rescue_from AuthorizationError, with: :authorization_error


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

    def authentication_error
        error = {
            "status" => "401",
            "source" => {"pointer" => "/code"},
            "title" => "Authentication code is invalid",
            "detail" => "You must provide valid code in order to change it for token."
        } 
        render json: { "error" : [error] }, status: 401
    end

    def authorization_error
        error = {
            "status" => "401",
            "source" => {"pointer" => "/code"},
            "title" => "Authentication code is invalid",
            "detail" => "You must provide valid code in order to change it for token."
        } 
        render json: { "error" : [error] }, status: 401
    end
end
