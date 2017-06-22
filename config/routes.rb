Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  get "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get '/flowers/category/:category_id', to: 'flowers#index', as: "flow"

  root  "sliders#index"
  
  resources :flowers, :categories, :bouquets, :advices, :sliders

  namespace :admin do
    resources :categories
    resources :flowers, :advices, :bouquets, :sliders do
      resources :attachments
    end
  end
end
