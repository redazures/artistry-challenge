Rails.application.routes.draw do
    resources :artists 
    resources :instruments
    resources :plays     
end
