class PrototypesController < ApplicationController
  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end
  def create
    Prototype.create(create_params)
      redirect_to root_path, notice: 'succeed in post'
  end
  private
  def create_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      prototype_images_attributes: [:id, :content, :role])
  end
end
