class UsersController < ApplicationController
    before_action :authenticate_user!, except: :show
    before_action :set_user, only: [:show, :edit, :update]
    before_action :edit_user, only: [:edit, :update]

    def show
        @histories = @user.histories
    end

    def edit
    end

    def update
        if  current_user.update(user_params)
            redirect_to user_path(current_user.id)
        else
            render :edit
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :position_id, :affiliation_id, :affiliation_team, :introduction)
    end

    def edit_user
        unless current_user.id == @user.id
            redirect_to root_path
        end
    end
end
