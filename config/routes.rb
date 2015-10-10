Rails.application.routes.draw do
  post 'api/user/new'
  post 'api/session/create'
  get 'api/session/test'
  get 'api/session/test2'
end
