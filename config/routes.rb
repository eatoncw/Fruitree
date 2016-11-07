Rails.application.routes.draw do

  devise_for :users, :path => 'my', :controllers => { :registrations => "user_registrations" }
	resources :users, except: [:new, :create]
	resources :products do
		resources :comments, except: [:new, :edit, :update] do
			member do
				patch :flag
			end
		end
	end
	
	get 'static/landingpage'
	get 'static/contact'
	post 'static/thank_you'
	
	root 'static#landingpage'
end
