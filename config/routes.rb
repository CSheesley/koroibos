Rails.application.routes.draw do

  root to: 'welcome#index'

  namespace :api do
    namespace :v1 do
      get '/olympians', to: 'olympians#index'
      get '/olympian_stats', to: 'olympian_stats#index'

      get '/events', to: 'events#index'
      get '/events/:id/medalists', to: 'medalists#index'
    end
  end

end
