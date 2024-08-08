Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }
  Rails.application.config.default_url_options = { host: 'localhost', port: 3000 }

  resources :password_resets, only: [:new, :create, :edit, :update]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end


  root 'home#index'

  # Кабинет администратора
  namespace :admin do
    root to: 'dashboard#index', as: 'dashboard'
    resources :teachers, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :students, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :subjects, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  get '/admin/subjects/:id', to: 'admin/subjects#destroy', as: 'destroy_admin_subject'
  get '/admin/students/:id', to: 'admin/students#destroy', as: 'destroy_admin_student'



  # Кабинет учителя
  namespace :teacher do
    root to: 'dashboard#index', as: 'dashboard'
    resources :grades, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :students, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :subjects, only: [:index, :new, :create, :edit, :update, :destroy]
    post '/grades', to: 'grades#create'
  end
end
