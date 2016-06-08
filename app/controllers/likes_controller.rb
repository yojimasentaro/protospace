class LikesController < ApplicationController

  before_action :set_prototype, :set_likes, only: [:create, :destroy]

  def create
    @like  = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    set_js
  end

  def destroy
    @like = current_user.likes.find_by(prototype_id: params[:prototype_id])
    @like.destroy
    set_js
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def set_likes
    @likes = Like.where(prototype_id: params[:prototype_id])
  end

  def set_js
   render partial: "likes/js_like"
  end

end
