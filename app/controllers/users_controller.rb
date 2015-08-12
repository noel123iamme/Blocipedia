class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
  end

  def downgrade
  	current_user.downgrade_to_standard
  	current_user.save
  	redirect_to edit_user_registration_path(current_user)
  end
end
