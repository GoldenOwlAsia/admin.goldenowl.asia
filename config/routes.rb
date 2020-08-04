Rails.application.routes.draw do
  resources :activities
  resources :careers do
    resources :job_submissions
  end
  devise_for :users
  resources :posts
  get 'home', to: 'home#index'
  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[index show] do
        member do
          get 'related-posts', to: :related_posts
        end
      end
      resources :careers, only: %i[index show]
      resources :activities, only: %i[index show]
      resources :job_submissions
      resources :subscriptions
    end
  end
end
