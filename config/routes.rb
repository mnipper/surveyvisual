require 'sidekiq/web'

SurveyVisual::Application.routes.draw do

  resources :questions

  resources :participants do
    resources :results do
      resources :answers
    end
  end

  mount Sidekiq::Web, at: '/sidekiq'

end
