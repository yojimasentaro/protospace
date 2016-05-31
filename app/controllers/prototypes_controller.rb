class PrototypesController < ApplicationController

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC")
  end

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

  def show
    @prototype = Prototype.find(params[:id])
  end

  private

  def create_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      prototype_images_attributes: [:id, :content, :role])
  end
end
