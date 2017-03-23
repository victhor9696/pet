Rails.application.routes.draw do
  get 'pets/index'

  root to: "pets#index"
end
