Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'

  namespace :api do
    resources :category, except: %i[edit new]
    resources :item, except: %i[edit new]
    resources :product, except: %i[edit new]
    resources :purchase, except: %i[edit new]

    root to: ->(_) { [200, {}, ['pong']] }
  end
end
