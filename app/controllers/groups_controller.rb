class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.includes(image_attachment: :blob).all
  end

  def new; end

  def create
    new_group = Group.new model_params
    new_group.user = current_user

    return unless new_group.save

    respond_to do |f|
      f.html { redirect_to category_budgetting_transactions_path(category_id: new_group.id) }
    end
  end

  def model_params
    params.require(:category).permit(:image, :name)
  end
end
