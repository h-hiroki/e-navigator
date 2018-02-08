Rails.application.routes.draw do
  devise_for :users

  root 'users#index'

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: [:index, :edit, :update] do
    resources :interviews
  end

  # patch 'users/:user_id/interview/:id', to: 'interviews#change_state', as: 'user_interview_change_state'

end
