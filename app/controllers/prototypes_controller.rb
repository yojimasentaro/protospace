class PrototypesController < ApplicationController

  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.order("prototypes.created_at DESC").eager_load(:user, :prototype_images).page(params[:page])
    @status = 'newest'
  end

  def new
    @prototype    = Prototype.new
    @main_content = @prototype.prototype_images.build
    @sub_contents = 1.times { @prototype.prototype_images.build }
  end

  def create
    @prototype  = current_user.prototypes.new(create_params)

    if @prototype.save
      redirect_to root_path, notice: 'Posted Successfully!'
    else
      render :new, alert: 'Sorry, but something went wrong.'
    end
  end

  def show
    @likes    = Like.where(prototype_id: params[:id])
    @comments = @prototype.comments.includes(:user).all
    @comment  = @prototype.comments.build(user_id: current_user.id) if current_user
  end

  def edit
    @main_content = @prototype.prototype_images.main
    @sub_contents = @prototype.set_sub_contents
  end

  def update
      if @prototype.user_id == current_user.id && @prototype.update(create_params)
        redirect_to root_path, notice: 'Updated Successfully!'
      else
        render :edit, alert: 'Sorry, but something went wrong.'
      end
  end

  def destroy
    @prototype.destroy
    redirect_to root_path, notice: 'Deleted Successfully!'
  end

  private

  def set_prototype
    @prototype    = Prototype.find(params[:id])
  end

  def create_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      prototype_images_attributes: [:id, :content, :role]
      ).merge(tag_list: params[:prototype][:tag])
  end

end
