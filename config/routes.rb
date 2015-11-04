# -*- encoding: utf-8 -*-

Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'
  get 'home/show'

  devise_for :users, controllers: {
    sessions: 'users/session',
    passwords: 'users/password',
    registrations: 'users/registration'
  }

  resources :admins, only: [:show, :index]

  devise_for :admins, controllers: {
    sessions: 'admins/session',
    passwords: 'admins/password',
    registrations: 'admins/registration'
  }

  resources :admins, only: [:show, :index]

end
