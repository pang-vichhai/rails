class User < ApplicationRecord
    validates :login, presence:true, uniqueness:true
    validates :provider, presence:true

    has_one :access_tokens, dependent: :destroy
    has_many :blogs, dependent: :destroy
    has_many :commentings, dependent: :destroy
end
