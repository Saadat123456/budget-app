class BudgettingTransactionsController < ApplicationController
  def index
    category_id = params[:category_id]
    @transactions = BudgettingTransaction.where(group_id: category_id)
    @category = Group.find(category_id.to_i)
  end

  def new
    @category_id = params[:category_id]
  end

  def show
    @transaction = BudgettingTransaction.find params[:id]
  end

  def create
    transaction = BudgettingTransaction.new budgetting_transaction_params
    transaction.user = current_user
    transaction.group_id = params[:category_id]

    return unless transaction.save

    respond_to do |f|
      f.html { redirect_to category_budgetting_transactions_path }
    end
  end

  def budgetting_transaction_params
    params.require(:budgetting_transactions).permit(:name, :amount)
  end
end
