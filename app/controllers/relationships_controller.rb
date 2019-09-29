class RelationshipsController < ApplicationController
  def create
    user     = User.find(params[:user_id])
    follow = current_user.following_relationships.build(follower_id: params[:user_id])
    follow.save!
    redirect_to users_path
  end

  def destroy
    follow = current_user.following_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to users_path
  end
end
