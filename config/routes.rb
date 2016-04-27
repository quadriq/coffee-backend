Rails.application.routes.draw do

  scope "/api" do

    resources :transactions
    resources :bills
    resources :cardnums
    resources :pins

    resources :paymethods do
      resources :transactions
    end

    devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
    }  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

    resources :users do
      resources :transactions
    end

    resources :users do
      resources :cardnums
    end

    resources :users do
      resources :pins
    end

  end

end
