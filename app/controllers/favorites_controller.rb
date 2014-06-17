class FavoritesController < ApplicationController
   before_action :find_user

  def index
    @favorites = @user.favorites
  end

  def create
    current_user.favorites.create({
      user_id: params[:user_id],
      event_id: params[:event_id]
      })
    redirect_to user_favorites_path
  end

  def destroy
    Favorite.find(params[:id]).destroy
    redirect_to user_favorites_path
  end

  private

  def find_user
      @user = current_user
    end

    # def favorite_params
    #   params.require(:favorite).permit(
    #     :user_id,
    #     :event_id
    #   )
    # end

end
