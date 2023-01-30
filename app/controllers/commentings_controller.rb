class CommentingsController < ApplicationController
  before_action :set_commenting, only: [:index]
  before_action :load_blog, only: [:create]

  # GET /commentings
  def index
    # @commentings = Commenting.all
    commentings = @blog.commentings
      page(params[:page]).
      per(params[:per_page])
    render json: commentings
  end

  # GET /commentings/1
  # def show
  #   render json: @commenting
  # end

  # POST /commentings
  def create
    @commenting = Commenting.new(commenting_params.merge(user: current_user))

    @commenting.save!
    render json: @commenting, status: :created, location: @blog
  rescue
    render json: @commenting, adapter: 'json_api'
      serializer: ErrorSerializer
      status: :unprocessable_entity
  end

  # PATCH/PUT /commentings/1
  # def update
  #   if @commenting.update(commenting_params)
  #     render json: @commenting
  #   else
  #     render json: @commenting.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /commentings/1
  # def destroy
  #   @commenting.destroy
  # end

  private

    def load_blog
      @blog = Blog.find(params[:article_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    # def set_commenting
    #   @commenting = Commenting.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def commenting_params
      params.require(:data).require(:attributes).
        permit(:content) || 
        ActionController::Parameters.new
    end
end
