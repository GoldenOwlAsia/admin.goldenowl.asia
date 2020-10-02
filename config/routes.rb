Rails.application.routes.draw do
  devise_for :users

  get 'home', to: 'home#index'
  root 'home#index'

  resources :careers do
    resources :job_submissions
  end

  resources :posts
  resources :job_submissions, only: :index
  resources :subscriptions, only: :index

  namespace :api do
    namespace :v1 do
      resources :posts, only: %i[index show] do
        member do
          get 'related-posts', to: :related_posts
        end
      end
      resources :careers, only: %i[index show]
      resources :job_submissions, only: %i[create index]
      resources :subscriptions
    end
  end
end
