class CommentsController < ApplicationController
  before_action :set_prototype, only: [:create, :destroy]

  def create
    @comment  = @prototype.comments.create(create_comment_params)
    @comments = @prototype.comments
  end

  def destroy
    Comment.find(params[:id]).destroy
    @comments = @prototype.comments
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def create_comment_params
    params.require(:comment).permit(:user_id, :prototype_id, :content)
  end

end
