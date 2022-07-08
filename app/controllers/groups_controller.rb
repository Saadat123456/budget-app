class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new; end

  def create
    new_group = Group.new model_params
    new_group.user = current_user
    if new_group.save
      respond_to do |f|
        f.html { redirect_to root_path }
      end
    end
  end

  def model_params
    params.require(:category).permit(:image, :name)
  end
end
