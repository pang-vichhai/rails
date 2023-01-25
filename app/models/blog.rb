class Blog < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    validates :slug, presence: true, uniqueness: true
end
