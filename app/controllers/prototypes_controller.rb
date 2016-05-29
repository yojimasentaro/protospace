class PrototypesController < ApplicationController
  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype  = current_user.prototypes.new(create_params)

    if @prototype.save
      redirect_to root_path, notice: 'Posted Successfully!'
    else
      render :new, alert: 'Sorry, but something went wrong'
    end
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
