class PostsController < ApplicationController
  before_action :post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: :show

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)

    @post.save
    
    redirect_to posts_path, notice: "Post was successfully created"
  end

  def edit
  end

  def update
    @post.assign_attributes(post_params)

    if @post.save
      flash[:notice] = "Post was successfully updated"
    else
      flash[:notice] = "Updating failed"
  end
    redirect_to @post
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post was successfully deleted"
    redirect_to posts_path
  end


  private

  def post
    @post ||= Post.find(params[:id])
  end
  helper_method :post

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
