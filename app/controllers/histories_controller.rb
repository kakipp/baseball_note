class HistoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_history, only: [:show, :edit, :update, :destroy]
  before_action :edit_history, only: [:edit, :update, :destroy]
  def index
    @histories = History.includes(:user).order("created_at DESC")
  end

  def new
    @history = HistoriesTag.new
  end

  def create
    @history = HistoriesTag.new(history_params)
    if @history.valid? 
        @history.save
        redirect_to root_path
    else
        render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @history = HistoriesTag.new(history_params)
    if @history.valid? 
        @history.save
        redirect_to root_path
    else
        render :edit
    end
  end

  def destroy
    if @history.destroy
        redirect_to root_path
    end
  end

  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private

  def history_params
    params.require(:histories_tag).permit(:title, :text, :category_id, :name).merge(user_id: current_user.id)
  end

  def set_history
    @history = History.find(params[:id])
  end

  def edit_history
    unless current_user.id == @history.user_id 
        redirect_to root_path
    end
  end
end
