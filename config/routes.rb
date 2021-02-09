Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'api/v1/auth/signin', to: 'api/v1/authentication#authenticate'
  post 'api/v1/users/signup', to: 'api/v1/users#create'
end
