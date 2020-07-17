Rails.application.routes.draw do
 get 'top' => 'homes#top'

 root 'homes#top'

 resources :books
end
