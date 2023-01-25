require 'rails-helper'

Rspec.describe BlogsController do
    describe '#index' do
        it 'return a success response'
            get '/blogs'
            expect(resopnse).to have_http_status(:ok)
        end
    end
end