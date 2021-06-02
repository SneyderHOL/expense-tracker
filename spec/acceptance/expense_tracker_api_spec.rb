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
    
  end
  
  it 'records submitted expenses' do
    coffee = post_expense(
      payee: 'Starbucks',
      amount: 5.75,
      date: '2017-06-10'
    )

    post '/expenses', params: JSON.generate(coffee)
    expect(response.status).to eq(200)

    parsed = JSON.parse(response.body)
    expect(parsed).to include('expense_id' => a_kind_of(Integer))
  end
end
