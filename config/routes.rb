Rails.application.routes.draw do
  resources :trips do
    member do
      post :trip_history
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
