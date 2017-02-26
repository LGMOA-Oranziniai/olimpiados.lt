Rails.application.routes.draw do
  root :to => "articles#index"

  get 'articles/index'
  get 'categories/show'

  get '/:alias' => 'categories#show', as: :category, param: :alias

  # scope "(:locale)", locale: /en|lt|ru/ do

  #   root 'apartments#index'

  #   resources :apartments, only: [:index, :show]
    
  #   get 'services' => 'static_pages#services', as: :services

  #   get 'tips' => 'tips#index', as: :tips

  #   get 'help' => 'static_pages#help', as: :help

  #   get 'contact' => 'static_pages#contact', as: :contact
  #   post 'contact' => 'static_pages#send_message', as: :send_message
  # end
end
