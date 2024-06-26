# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope "(:locale)", locale: /en|de/ do
    get 'welcome', to: 'welcome#index'
    get '/choose_language', to: 'welcome#choose_language'
    resources :guests do
      resources :plus_ones
      member do
        get :confirm
        patch :complete
        get :more_info
      end
    end
  end

  get '/:locale' => 'welcome#index'

  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
