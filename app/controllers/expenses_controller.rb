class ExpensesController < ApplicationController
  def new
    render json: { expense_id: 42 }
  end
end
