class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @pictures = @user.pictures
    @picture = Picture.new
  end
end
