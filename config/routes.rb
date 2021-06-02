Rails.application.routes.draw do
  post "/expenses", to: "expenses#new"
  
end
