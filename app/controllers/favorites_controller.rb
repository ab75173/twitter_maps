class FavoritesController < ApplicationController
   before_action :find_user

  def index
    @favorites = @user.favorites
  end

  def create
    id = params[:event_id]
    Favorite.create(event_id: id, user_id: current_user.id )
    # current_user.favorites.create({
    #   user_id: params[:user_id],
    #   event_id: params[:event_id]
    #   })
    UserMailer.notification_email(current_user).deliver
    redirect_to user_favorites_path(current_user)
  end

  def destroy
      @favorite = Favorite.find(params[:id])
      @favorite.destroy
      redirect_to user_favorites_path(current_user)
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
