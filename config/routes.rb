Rails.application.routes.draw do
  root "welcome#index"
  get "/word_validation", to: "word_validator#show"
end
