class PostsController < ApplicationController
  before_action :current_post, only: [:show, :edit, :update]

  def show

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.new
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @post.update(post_params)

    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end

  def current_post
    @post = Post.find(params[:id])
  end
end
