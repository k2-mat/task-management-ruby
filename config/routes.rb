Rails.application.routes.draw do
  root to: redirect("/tasks")

  resources :tasks
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    passwords: "users/passwords",
    confirmations: "users/confirmations"
  }
end
