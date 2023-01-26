class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :update, :destroy]
    include Paginable

    def index      
        paginated = paginate(Blog.recent) 
        render_collection(paginated)
    end

    def show
        one_blog = Blog.find(params[:id])
        render json: serializer.new(one_blog)
    end

    def serializer 
        BlogSerializer
    end



end