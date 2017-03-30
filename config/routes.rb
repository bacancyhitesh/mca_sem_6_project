Rails.application.routes.draw do
  #Ketan
  devise_for :employers, controllers: { application: 'application' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :employers, only: [:edit] do
    collection do
      patch 'update_password'
    end
  end
    resources :employers
    resources :companies
    resources :jobs
    resources :job_applies
    get 'download', to: 'job_applies#download', as: :download_file
    get 'rejected', to: 'job_applies#rejected', as: :rejected
    get 'job_seeker', to: 'job_applies#job_seeker', as: :job_seeker
    get 'total', to: 'job_applies#total', as: :total_job_applies
    resources :contact_people
    resources :industry_types
    resources :job_types
    resources :roles
    resources :cities
#Ketan

#pratik ---- all below
  resources :experiences
  get 'list', to: 'jobs#list', as: :alljob
  resources :educations
  resources :education_details
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  root "users#home"
  resource :skills
  resources :locations
  resources :education_details
  resources :educations

  resource :user, only: [:edit] do
  collection do
    patch 'update_password'
  end
end
#post "/users/password" => "devise/passwords#create" ,as: "changepassword"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
