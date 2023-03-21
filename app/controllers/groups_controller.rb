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
      flash[:notice] = 'Categorie created successfully'
    else
      flash[:error] = "Can't be blank, record didn't get saved"
      render :new
    end
  end

  private

  def categorie_params
    params.require(:group).permit(:name, :icon)
  end
end
