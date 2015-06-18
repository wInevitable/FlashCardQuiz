Rails.application.routes.draw do
  root to: 'pages#home'
  resources :flash_cards, only: [:new, :create, :show]
  resources :quizzes, only: [:create, :show]
end
