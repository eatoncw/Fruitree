Rails.application.routes.draw do

	resources :products
	
	get 'static/landingpage'
	get 'static/contact'
	post 'static/thank_you'
	
	root 'static#landingpage'
end
