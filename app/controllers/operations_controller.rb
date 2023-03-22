class OperationsController < ApplicationController
  def index
    @operations = Group.find_by(user: current_user, id: params[:group_id]).operations
  end
end
