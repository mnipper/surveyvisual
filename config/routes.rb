SurveyVisual::Application.routes.draw do

resources :questions
resources :results do
  resources :answers
end

end
