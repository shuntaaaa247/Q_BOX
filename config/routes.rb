Rails.application.routes.draw do
  get "answers/create"
  root "questions#index"

  resources :questions, only: [ :show, :new, :create ] do
    get "list", on: :member
    get "search", on: :collection, to: "questions#search"
    get "download_json", on: :member
  end
  resources :answers, only: [ :show, :new, :create, :update ]
  # GETメソッドで"questions/:id"がリクエストされたら、questionsコントローラーのshowを呼び出す。as: ~はerbファイルなどで遷移を記述する時に指定するパス?
  # get "questions/:id", to: "questions#show", as: "question"

  # get "new/question", to: "questions#new", as: "new"

  # get "questions/index"
  # # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # # Defines the root path route ("/")
  # # root "posts#index"
end
