Rails.application.routes.draw do
  config = Rails.application.config.baukis2
  constraints host: config[:staff][:host] do

  end
  namespace :staff do
    root "top#index"
  end
  namespace :admin do
    root "top#index"
  end
  namespace :customer do
    root "top#index"
  end
end
