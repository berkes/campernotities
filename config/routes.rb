Campernotities::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  ActiveAdmin.routes(self)

  match "/campings/:id" => "campings#show", :as => :camping
  match "/authors/:id" => "authors#show", :as => :author
  match "/authors" => "authors#index", :as => :authors

  root :to => "authors#home"
end
