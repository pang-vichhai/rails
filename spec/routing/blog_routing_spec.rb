require 'rails-helper'

Rspec.describe '/blogs routes' do
    it 'routes to blogs#index' do
        # expect(get '/blogs').to route_to(controller: 'blogs', action: 'index')
        expect(get '/blogs').to route_to('blogs#index')
        expect(get '/blogs?page[number]=3').to route_to('blogs#index', page: {number:3})
    end
end