TestNotes::Application.routes.draw do
  devise_for :users

  root :to => 'notebooks#index'
  resources :notebooks do
    resources :notes
  end

  namespace :api do
    namespace :v1 do
      resources :tokens,:only => [:create, :destroy]
    end
  end
end
