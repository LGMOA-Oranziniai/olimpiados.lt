Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "articles#index"


  resources :categories, only: :show, param: :name, path: ""
  resources :articles, path: "straipsniai", only: [:show, :edit, :update], param: :title

  get 'static_pages/about_us'
  get 'static_pages/contacts'

  # get 'articles/index'
  # get 'categories/show'

  # get '/:category' => 'categories#show', as: :category

  # scope "(:category)" do
  #   get '/:article' => 'articles#show', as: :article

    # root 'apartments#index'

    # resources :apartments, only: [:index, :show]
    
    # get 'services' => 'static_pages#services', as: :services

    # get 'tips' => 'tips#index', as: :tips

    # get 'help' => 'static_pages#help', as: :help

    # get 'contact' => 'static_pages#contact', as: :contact
    # post 'contact' => 'static_pages#send_message', as: :send_message
  # end
end
