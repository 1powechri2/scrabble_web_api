Rails.application.routes.draw do
  root "welcome#index"
  get "/word_validation", to: "word_validator#show"

  namespace :api do
    namespace :v1 do
      get 'games/:id', to: "games#show"
    end
  end
end
