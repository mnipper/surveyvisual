SurveyVisual::Application.routes.draw do

resources :questions

resources :participants do
  resources :results do
    resources :answers
  end
end

end
