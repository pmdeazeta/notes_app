TestNotes::Application.routes.draw do
  root :to => 'notebooks#index'
  resources :notebooks do
    resources :notes
  end
end
