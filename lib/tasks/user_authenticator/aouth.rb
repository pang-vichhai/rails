class UserAuthenticator
    class AuthenticationError < StandardError; end
    attr_reader :users
    def initialize(code)
        @code = code
    end

    def perform
        
        raise AuthenticationError if code.blank?
        raise AuthenticationError if token.try(:error).present?
        prepare_user

    end

    private

    def client
        @client ||= Octokit::Client.new(
            client_id: ENV['GITHUB_CLIENT_ID'],
            client_secret: ENV['GITHUB_CLIENT_SECRET']
        )
    end

    def token
        @token ||= client.exchange_code_for_token(code)
    end

    def user_data
        @user_data ||= Octokit::Client.new(
            access_token : token
        ).user.to_h.slice(:login, :avatar_url, :url, :name)
    end

    def prepare_user
        @user = if User.exists?(login: user_data[:login])
            User.find_by(login: user_data[:login])
        else
            User.create(user_date.merge(provider :'github'))
        end
    end
    attr_reader :code
end