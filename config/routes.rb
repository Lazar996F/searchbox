Rails.application.routes.draw do
  root 'term#index'
  resources :term, only: [:index, :create]
  get '/term/analytics', to: 'term#analytics', as: 'term_analytics'
end