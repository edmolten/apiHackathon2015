Rails.application.routes.draw do
  post 'api/user/new'
  post 'api/session/create'
  post 'api/clase/new'
  get 'api/session/test'
  get 'api/session/test2'
  get 'api/tema/get'
  get 'api/clase/get'
  get 'api/user/get'
end
