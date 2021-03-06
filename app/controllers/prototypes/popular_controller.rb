class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.order("prototypes.likes_count DESC").eager_load(:user, :prototype_images).page(params[:page])
    @status = 'popular'
    render 'prototypes/index'
  end
end
