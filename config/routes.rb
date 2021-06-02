Rails.application.routes.draw do
  post "/expenses", to: "expenses#new"
  get "/expenses/:date", to: "expenses#by_date"
end
