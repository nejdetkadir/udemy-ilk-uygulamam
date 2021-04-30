Rails.application.routes.draw do
  root to: "pages#index"
  get '/about_us', to: "pages#about_us"
  # xxxxxxx/about_us

  resources :todos
end
