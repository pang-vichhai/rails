class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :update, :destroy]

    def index 
        @blogs = Blog.recent 
        # render json: @blogs
        render json: serializer.new(@blogs)
    end

    def serializer 
        BlogSerializer
    end
end