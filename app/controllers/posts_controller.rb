class PostsController < ApplicationController
  before_action :get_post, only: %i[show]

  def index; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: 'Your post was created successfully'
    else
      render :new
    end
  end

  def show; end

  private

    def post_params
      params.require(:post).permit(:date, :rationale)
    end

    def get_post
      @post = Post.find(params[:id])
    end
end
