# -*- encoding: utf-8 -*-

Rails.application.routes.draw do
  get 'users/indes'

  get 'users/show'

  root to: 'home#index'

  get 'home/index'
  get 'home/show'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :index]

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }

  resources :admins, only: [:show, :index]

  resources :tickets

end
