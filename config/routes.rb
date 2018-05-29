Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'url#index'
  get '/:short_url', to: 'url#show'
  post '/links', to: 'url#create'
end

