# -*- encoding: utf-8 -*-

Rails.application.routes.draw do
  root to: 'home#index'

  get 'home/index'
  get 'home/show'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
    unlocks: 'users/unlocks',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  resources :users, only: [:show, :index]

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations',
    confirmations: 'admins/confirmations',
    unlocks: 'admins/unlocks'
#    omniauth_callbacks: 'admins/omniauth_callbacks'
  }

  resources :admins, only: [:show, :index]

  resources :tickets

  resources :messages, only: [:new, :create, :destroy]
end
