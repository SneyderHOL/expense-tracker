require 'rails_helper'
#require 'rack/test'

#module ExpenseTracker
RSpec.describe "Expense Tracker API", type: :request do
  #include Rack::Test::Methods

  # def app
  #   ExpenseTracker::API.new
  # end

  # helper method post_expense
  def post_expense(expense)
    post '/expenses', params: JSON.generate(expense)
    expect(response).to have_http_status(:success)
    
    parsed = JSON.parse(response.body)
    expect(parsed).to include('expense_id' => a_kind_of(Integer))
    expense.merge(id: parsed['expnese_id'])
  end
  
  it 'records submitted expenses' do
    pending 'Need to persist expenses'
    coffee = post_expense(
      payee: 'Starbucks',
      amount: 5.75,
      date: '2017-06-10'
    )

    zoo = post_expense(
      payee: 'Zoo',
      amount: 15.25,
      date: '2017-06-10'
    )
    
    groceries = post_expense(
      payee: 'Whole Foods',
      amount: 95.20,
      date: '2017-06-11'
    )
    
    get '/expenses/2017-06-10'
    expect(response.status).to eq(200)
    expenses = JSON.parse(response.body)
    expect(expenses).to contain_exactly(coffee, zoo)
  end
end
