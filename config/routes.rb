require 'sidekiq/web'

SurveyVisual::Application.routes.draw do

  root :to => 'participants#index'

  resources :questions
  resources :participants do
    collection do
      get :refresh
    end
    resources :results do
      resources :answers
    end
  end

  mount Sidekiq::Web, at: '/sidekiq'
end
