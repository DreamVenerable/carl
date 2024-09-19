Rails.application.routes.draw do
  root "home#index"
  get "models", to: "home#models"
  get "years", to: "home#years"
  get "engines", to: "home#engines"
  get "fitments", to: "home#fitments"
end
