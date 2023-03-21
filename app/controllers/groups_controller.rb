class GroupsController < ApplicationController
  def index
    @categories = Group.all.where(user: current_user).includes(:operations)
  end

  def new
    @categorie = Group.new
  end

  def create
    @categorie = Group.new(categorie_params)
    @categorie.user = current_user
    if @categorie.save
      redirect_to groups_path
    else
      render :new
    end
  end


  private
  
  def categorie_params
    params.require(:group).permit(:name, :icon)
  end
end
