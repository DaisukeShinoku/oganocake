Rails.application.routes.draw do

  root 'home#top'

  get 'home/invalid' => 'home#invalid'

  #admin
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #admin
  namespace :admin do
    resources :members,only: [:index, :show, :edit, :update] do
      collection do
        get :top
      end
    end
    resources :products,only: [:index, :show, :new, :create, :edit,:update]
    resources :genres,only: [:index, :create, :edit, :update]
    resources :orders,only: [:index, :show, :update]
  end


  #member
  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #member
  scope module: :member do
    resources :members, only: [:show, :edit, :update, :destroy] do
      member do
        get :quit
      end
      collection do
        get :top
      end
    end
    resources :destinations, only: [:index, :create, :show, :edit, :update, :destroy]
    resources :products, only: [:index, :show]
    resources :cart_products, only: [:index, :update, :create, :destroy] do
      collection do
        delete :all_destroy
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get :confirm
        get :thanks
      end
    end
  end
end