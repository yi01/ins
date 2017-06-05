class PicturesController < ApplicationController
  def index
    @pictures = Picture.order("created_at DESC")
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
    redirect_to pictures_path
    else
      redirect_to "users/#{current_user.id}"
    end
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to user_path(@picture.user.id)
  end

  private
  def picture_params
    params.require(:picture).permit(:image, :title).merge(user_id: current_user.id)
  end
end
