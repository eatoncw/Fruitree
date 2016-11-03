Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => "user_registrations" }
	resources :products
	
	get 'static/landingpage'
	get 'static/contact'
	post 'static/thank_you'
	
	root 'static#landingpage'
end
