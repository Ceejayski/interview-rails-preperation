class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @posts = Post.new(post_params)
    if @posts.save
      redirect_to @posts, notice: 'Post created successfully'
    else
      redirect_to new_post_path, notice: 'There are some errors'
    end
  end

  def edit; end

  def update
    # @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: 'Post updated successfully'
    else
      redirect_to edit_post_path, notice: 'There are some errors'
    end
  end

  def destroy
    # @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_url, notice: 'Post deleted successfully'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :body)
  end
end
