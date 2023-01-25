class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :update, :destroy]

    def index 
        @blogs = Blog.all 
        render json: @blogs
    end
end