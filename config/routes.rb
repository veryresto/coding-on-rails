Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :projects do
        resources :contents
      end
    end
  end

  post 'api/v1/auth/signin', to: 'api/v1/authentication#authenticate'
  post 'api/v1/users/signup', to: 'api/v1/users#create'
  get 'api/v1/projects/my_projects', to: 'api/v1/projects#myproject'
  put 'api/v1/contents/:id', to: 'api/v1/contents#update'
  delete 'api/v1/contents/:id', to: 'api/v1/contents#destroy'
end
