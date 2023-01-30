class BlogsController < ApplicationController
    skip_before_action :authorized!, only: [:index, :show]
    include Paginable

    def index      
        paginated = paginate(Blog.recent) 
        render_collection(paginated)
    end

    def show
        one_blog = Blog.find(params[:id])
        render json: serializer.new(one_blog)
    end

    def create 
        blog = current_user.blogs.build(blog_params)
        blog.save! 
        render json: blog, status: :created
    rescue
        render json: blog, adapter : 'json_api',
            serializer: ErrorSerializer,
            status: :unprocessable_entity
    end

    def update
        blog = current_user.blogs.find(params[:id])
        blog.update_attributes!(blog_params)
    rescue ActiveRecord::RecordNotFound
        authorization_error
    rescue
        render json: blog, adapter : 'json_api',
            serializer: ErrorSerializer,
            status: :unprocessable_entity
    end

    def destroy
        blog = current_user.blogs.find(params[:id])
        blog.destroy
        head :no_content
    rescue
        authorization_error
    end

    private

    def blog_params
        params.require(:data).require(:attributes).permit(:title, :content, :slug) ||
        ActionController::Parameters.new
    end

    def serializer 
        BlogSerializer
    end



end