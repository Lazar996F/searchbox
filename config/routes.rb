# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  resources :term, only: [:index, :create]
  get '/term/analytics', to: 'term#analytics', as: 'term_analytics'
end
