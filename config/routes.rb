Rails.application.routes.draw do
  resources :cocktails do
    resources :ingredients, only: [:index, :show] do
      resources :doses
    end
  end
end
