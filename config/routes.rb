Rails.application.routes.draw do
  delete '/articles/delete',          to: 'articles#destroy_selected', constraints: { only_ajax: true }
  post   '/articles/half-size-state', to: 'articles#half_size_state',  constraints: { active: true|false, only_ajax: true }

  resources 'articles', only: [:index, :destroy]

  get '/settings',   to: 'settings#index'
  get '/statistics', to: 'statistics#index'

  scope '/admin' do
    resources 'categories' do
      resources 'tags'
    end
  end

  root 'welcome#index'
end
