class ExpensesController < ApplicationController
  def new
    render json: { expense_id: 42 }
  end

  def by_date
    render json: []
  end
end
