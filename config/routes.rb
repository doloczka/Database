Rails.application.routes.draw do
 
  resources :wiadomoscis
  get 'student/za1' =>'student#za1'
  get 'student/inbox' =>'student#inbox'
  get 'student/za2' =>'student#za2'

  get 'konto/rejestracja'

  get 'logowanie_form' => 'konto#logowanie_form'
  
  post 'logowanie' => 'konto#logowanie'
  
  delete 'logout' => 'konto#wylogowanie'

  get 'konto/pierwsze_logowanie'

  root 'database#index'
  
  resources :wykladowca do
    resources :grupies, shallow: true do
      resources :student
    end
  end
   post 'student/zad11' => 'student#zad11'
   post 'student/zad12' => 'student#zad12'
   post 'student/zad13' => 'student#zad13'
   post 'student/zad14' => 'student#zad14'
   post 'student/zad15' => 'student#zad15'
   
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
