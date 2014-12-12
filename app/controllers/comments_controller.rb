class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :post

  def create
    comment = post.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      respond_to do |format|
        format.html { redirect_to post_path(post) } #, notice: "Comment was successfully created"
        format.js
      end
    else
      flash[:warning] = "Failed creating comment!"
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:title, :message)
  end

  def post
    @post ||= Post.find(params[:post_id])
  end
  helper_method :post

end
