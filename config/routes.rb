Rails.application.routes.draw do
 

  resources :zadania_glownes

  resources :wiadomoscis

  get 'student/za1' =>'student#za1'
  get 'student/za2' =>'student#za2'
  get 'student/za3' =>'student#za3'
  get 'student/za4' =>'student#za4'
  get 'student/za5' =>'student#za5'
  
  post 'student/rozwiazanie' => 'student#rozwiazanie'
  
  get 'student/challenge' =>'student#challenge'
  get 'student/chosechallenge' =>'student#chosechallenge'
  get 'student/challengeodp' =>'student#challengeodp'
  get 'student/challengeodp2' =>'student#challengeodp2'
  get 'student/challengeinbox' =>'student#challengeinbox'
  post 'student/challengeconfirm' =>'student#challengeconfirm'
  post 'student/challengeconfirm2' =>'student#challengeconfirm2'
  
  get 'konto/rejestracja'

  get 'logowanie_form' => 'konto#logowanie_form'
  
  post 'logowanie' => 'konto#logowanie'
  
  delete 'logout' => 'konto#wylogowanie'

  get 'konto/pierwsze_logowanie'

  root 'database#index'
  
  resources :wykladowca do
    resources :zadania_glownes
    resources :grupies, shallow: true do
      resources :student
    end
  end
   
  
   
  
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
