Rails.application.routes.draw do

  root to: 'public/items#top'

  namespace :admin do
    root to: "orders#index"
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
