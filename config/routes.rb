Rails.application.routes.draw do
  devise_for :users

  root 'users#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:index, :edit, :update] do
    resources :interviews
  end

  post 'users/:user_id/interviews/:id', to: 'interviews#change_state', as: 'user_interviews_change_state'
end
